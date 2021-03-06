<?php namespace Common\Localizations;

use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Illuminate\Filesystem\Filesystem;
use Illuminate\Database\Eloquent\Collection;

class LocalizationsRepository
{
    /**
     * @var Filesystem
     */
    private $fs;

    /**
     * @var Localization
     */
    private $localization;

    /**
     * Path to files with default localization language lines.
     */
    const DEFAULT_TRANS_PATHS = [
        'client-translations.json',
        'server-translations.json',
    ];

    /**
     * @param Filesystem $fs
     * @param Localization $localization
     */
    public function __construct(Filesystem $fs, Localization $localization)
    {
        $this->fs = $fs;
        $this->localization = $localization;
    }

    /**
     * @return Collection
     */
    public function all()
    {
        return $this->localization->all()->map(function(Localization $localization) {
            return ['model' => $localization];
        });
    }

    /**
     * @param string $name
     * @return array
     */
    public function getByNameOrCode($name)
    {
        $localization = $this->localization->where('name', $name)->orWhere('language', $name)->first();
        if ( ! $localization) return null;

        return ['model' => $localization, 'lines' => $this->getLocalizationLines($localization)];
    }

    /**
     * @param integer $id
     * @param array $data
     * @return array
     */
    public function update($id, $data)
    {
        $localization = $this->localization->findOrFail($id);
        $language = Arr::get($data, 'language');

        if (isset($data['name']) && $data['name'] !== $localization->name) {
            $localization->name = $data['name'];
        }

        if ($language && $language !== $localization->language) {
            $this->renameLocalizationLinesFile($localization, $language);
            $localization->language = $language;
        }

        if (isset($data['lines']) && $data['lines'] && ! empty($data['lines'])) {
            $this->storeLocalizationLines($localization, $data['lines']);
        }

        $localization->save();

        return $this->getByNameOrCode($localization->name);
    }

    /**
     * @param array $params
     * @return array
     */
    public function create($params)
    {
        $localization = $this->localization->create([
            'name' => $params['name'],
            'language' => $params['language'],
        ]);

        $lines = $this->getDefaultTranslationLines();
        $this->storeLocalizationLines($localization, $lines);

        return $this->getByNameOrCode($localization->name);
    }

    /**
     * Delete localization matching specified id.
     *
     * @param integer $id
     * @return bool|null
     */
    public function delete($id)
    {
        $localization = $this->localization->findOrFail($id);

        $this->fs->delete($this->makeLocalizationLinesPath($localization));

        return $localization->delete();
    }

    /**
     * Get default translations lines for the application.
     *
     * @return array
     */
    public function getDefaultTranslationLines()
    {
        $combined = [];

        foreach (self::DEFAULT_TRANS_PATHS as $path) {
            if ( ! $this->fs->exists(resource_path($path))) continue;
            $combined = array_merge($combined, json_decode($this->fs->get(resource_path($path)), true));
        }

        return $combined;
    }

    public function storeLocalizationLines(Localization $localization, $newLines)
    {
        $path = $this->makeLocalizationLinesPath($localization);
        $oldLines = [];

        if (file_exists($path)) {
            $oldLines = json_decode(file_get_contents($path), true);
        }

        $merged = array_merge($oldLines, $newLines);

        return file_put_contents($path, json_encode($merged));
    }

    /**
     * @param Localization $localization
     * @return array
     */
    public function getLocalizationLines(Localization $localization)
    {
        $path = $this->makeLocalizationLinesPath($localization);

        if (file_exists($path)) {
            return json_decode(file_get_contents($path), true);
        } else {
            return [];
        }
    }

    public function makeLocalizationLinesPath(Localization $localization)
    {
        return resource_path("lang/$localization->language.json");
    }

    /**
     * @param Localization $localization
     * @param string $newLangCode
     * @return bool
     */
    public function renameLocalizationLinesFile(Localization $localization, $newLangCode)
    {
        $oldPath = $this->makeLocalizationLinesPath($localization);
        $newPath = str_replace($localization->language, $newLangCode, $oldPath);
        return $this->fs->move($oldPath, $newPath);
    }
}

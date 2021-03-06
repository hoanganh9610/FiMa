<?php namespace Common\Core\Middleware;

use Closure;
use Common\Core\Controllers\HomeController;
use Illuminate\Http\Request;
use Illuminate\View\View;

class PrerenderIfCrawler
{
    protected $crawlerUserAgents = [
        'yahoo',
        'bingbot',
        'baiduspider',
        'facebookexternalhit',
        'twitterbot',
        'rogerbot',
        'linkedinbot',
        'embedly',
        'quora link preview',
        'showyoubot',
        'outbrain',
        'pinterest',
        'developers.google.com/+/web/snippet',
        'slackbot',
        'YandexBot'
    ];

    /**
     * Prerender request if it's requested by a crawler.
     *
     * @param Request $request
     * @param Closure $next
     * @param string $routeName
     * @return Request|View
     */
    public function handle(Request $request, Closure $next, $routeName = null)
    {
        if ($this->shouldPrerender($request)) {
            define('SHOULD_PRERENDER', true);

        // Always fallback to client routes if not prerendering
        // otherwise prerender routes will override client side routing
        } else if ($routeName !== 'homepage') {
            return app(HomeController::class)->show();
        }

        return $next($request);
    }

    /**
     * Check if request should be prerendered.
     *
     * @param Request $request
     * @return bool
     */
    protected function shouldPrerender(Request $request)
    {
        $userAgent = strtolower($request->server->get('HTTP_USER_AGENT'));
        $bufferAgent = $request->server->get('X-BUFFERBOT');

        $shouldPrerender = false;

        if ( ! $userAgent) return false;
        if ( ! $request->isMethod('GET')) return false;

        // prerender if _escaped_fragment_ is in the query string
        if ($request->query->has('_escaped_fragment_')) $shouldPrerender = true;

        // prerender if a crawler is detected
        foreach ($this->crawlerUserAgents as $crawlerUserAgent) {
            if (str_contains($userAgent, strtolower($crawlerUserAgent))) {
                $shouldPrerender = true;
            }
        }

        if ($bufferAgent) $shouldPrerender = true;

        return $shouldPrerender;
    }
}
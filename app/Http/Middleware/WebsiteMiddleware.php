<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class WebsiteMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $locale = $request->route('locale');
        // dd($locale !== "en" && $locale !== "ar");
        if ($locale !== "en" && $locale !== "ar"){

            abort(404);
        }
        else {
            return $next($request);
        }

    }
}

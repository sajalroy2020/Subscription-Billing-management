<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class IsFrontend
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
        if (isAddonInstalled('SUBSAAS') > 0 && getOption('frontend_status', 1) != ACTIVE) {
            if (getOption('registration_status', 0) == ACTIVE && (request()->route()->getName() == 'user.register.form' || request()->route()->getName() == 'user.register.store')) {
                return $next($request);
            } else {
                return redirect()->route('login');
            }
        }
        return $next($request);
    }
}

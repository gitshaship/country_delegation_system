<?php

namespace App\Http\Middleware;

use Illuminate\Support\Facades\Auth;
use Closure;

class BoardUserAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Auth::guard('api')->check() && $request->user()->profile == 'board') {
            return $next($request);
        } else {
            $message = ["message" => "Unauthorized user"];
            return response($message, 401);
        }

    }
}

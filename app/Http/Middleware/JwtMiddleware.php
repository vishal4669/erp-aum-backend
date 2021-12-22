<?php

namespace App\Http\Middleware;

use Closure;
use JWTAuth;
use Exception;
use Tymon\JWTAuth\Http\Middleware\BaseMiddleware;
use Illuminate\Http\Response;

use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Tymon\JWTAuth\Exceptions\TokenBlacklistedException;

class JwtMiddleware
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

        try {
            $user = JWTAuth::parseToken()->authenticate();
        } catch (Exception $e) {

            if ($e instanceof TokenInvalidException) {
                $response_array = array(
                    'status' => 401,
                    'data' => array(),
                    'success' => true,
                    'message' => 'Token is Invalid'
                );
                return response($response_array, Response::HTTP_UNAUTHORIZED);
            } else if ($e instanceof TokenExpiredException) {
                $response_array = array(
                    'status' => 401,
                    'data' => array(),
                    'success' => true,
                    'message' => 'Token is Expired'
                );
                return response($response_array, Response::HTTP_UNAUTHORIZED);
            } else if ($e instanceof TokenBlacklistedException) {
                $response_array = array(
                    'status' => 401,
                    'data' => array(),
                    'success' => true,
                    'message' => 'Token is blacklisted or expired'
                );
                return response($response_array, Response::HTTP_UNAUTHORIZED);
            } else {
                $response_array = array(
                    'status' => 401,
                    'data' => array(),
                    'success' => true,
                    'message' => 'Authorization Token not found'
                );
                return response($response_array, Response::HTTP_UNAUTHORIZED);
            }
        }
        return $next($request);
    }
}

%% -*- mode: Erlang; fill-column: 80; comment-column: 70; -*-
%%% ------------------------------------------------------------------
%%% bengine_app.erl
%%% ------------------------------------------------------------------
%%%
%%% @author Ulf Ejlertsson
%%% @copyright Ulf Ejlertsson 2011.
%%% @doc Implements the application behavior.
%%%      It start the root supervisor when the application is started.
%%% @end 
%%%

-module(bengine_app).

-behaviour(application).
-author({ulf, ejlertsson}).
-vsn("0.1.0").

%% Import unit tests.
-include_lib("eunit/include/eunit.hrl").

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    bengine_sup:start_link().

stop(_State) ->
    ok.

%% End of File

%%% -----------------------------------------------------------------------------
%%% bengine_sup.erl
%%% -----------------------------------------------------------------------------
%%% 
%%% @author Ulf Ejlertsson
%%% @copyright Ulf Ejlertsson 2011.
%%% @doc 
%%% @end 
%%%

-module(bengine_sup).

-behaviour(supervisor).
-author({ulf, ejlertsson}).
-vsn("0.1.0").

%% Import unit tests.
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok, { {one_for_one, 5, 10}, []} }.

%% ===================================================================
%% Unit tests
%% ===================================================================
-ifdef(TEST).

simple_test() ->
    ok = application:start(bengine),
    ?assertNot(undefined == whereis(bengine_sup)).

-endif.



%% End of File

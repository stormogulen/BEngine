%% -*- mode: Erlang; fill-column: 80; comment-column: 70; -*-
%%% -----------------------------------------------------------------------------
%%% be_sup.erl
%%% -----------------------------------------------------------------------------
%%% 
%%% @author Ulf Ejlertsson
%%% @copyright Ulf Ejlertsson 2011.
%%% @doc 
%%% @end 
%%% 

-module(be_sup).

-behavior(supervisor).
-author({ulf, ejlertsson}).
-vsn("0.1.0").

%% Import unit tests.
-include_lib("eunit/include/eunit.hrl").

%% API.
-export([start_link/0]).

%% Supervisor callback.
-export([
	 init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link( {local, ?SERVER}, ?MODULE, []).

init([]) ->
    ElementSup = {cc_event, {cc_event, start_link, []},
		  permanent, 2000, supervisor, [cc_element]},
    EventManager = {cc_event, {cc_event, start_link, []},
		    permanent, 2000, worker, [cc_event]},
    Children = [ElementSup, EventManager],
    RestartStrategy = {one_for_one, 4, 3600},
    {ok, {RestartStrategy, Children}}.


%% End of File

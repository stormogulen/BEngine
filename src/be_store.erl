%% -*- mode: Erlang; fill-column: 80; comment-column: 70; -*-
%%% -----------------------------------------------------------------------------
%%% be_store.erl
%%% -----------------------------------------------------------------------------
%%% 
%%% @author Ulf Ejlertsson
%%% @copyright Ulf Ejlertsson 2011.
%%% @doc 
%%% @end 
%%% 

-module(be_store).

%-behavior(supervisor|application|gen_server).
-author({ulf, ejlertsson}).
-vsn("0.1.0").

%% Import unit tests.
-include_lib("eunit/include/eunit.hrl").

%% API.
%-export([]).

%% Exports.
-export([
	  init/0,
	 insert/2,
	 delete/1,
	 lookup/1
	]).

-define(TABLE_ID, ?MODULE).

init() ->
    ets:new(?TABLE_ID, [public, named_table]),
    ok.

insert(Key, Pid) ->
    ets:insert(?TABLE_ID, {Key, Pid}).

lookup(Key) ->
    case ets:lookup(?TABLE_ID, Key) of
	[{Key, Pid}] ->
	    {ok, Pid};
	[] ->
	    {error, not_found}
    end.

delete(Pid) ->
    ets:match_delete(?TABLE_ID, {'_', Pid}).


%% End of File

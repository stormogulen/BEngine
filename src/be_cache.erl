%% -*- mode: Erlang; fill-column: 80; comment-column: 70; -*-
%%% -----------------------------------------------------------------------------
%%% be_cache.erl
%%% -----------------------------------------------------------------------------
%%%
%%% @author Ulf Ejlertsson
%%% @copyright Ulf Ejlertsson 2011.
%%% @doc
%%% @end
%%%

-module(be_cache).

%-behavior(supervisor|application|gen_server).
-author({ulf, ejlertsson}).
-vsn("0.1.0").

%% Import unit tests.
-include_lib("eunit/include/eunit.hrl").

%% Exports.
-export([
	 insert/2,
	 lookup/1,
	 delete/1
	]).

insert(Key, Value) ->
    case cc_store:lookup(Key) of
	{ok, Pid} ->
	    cc_event:replace(Key, Value),
	    cc_element:replace(Pid, Value);
	{error, _} ->
	    {ok, Pid} = cc_element:create(Value),
	    cc_store:insert(Key, Pid),
	    cc_event:create(Key, Value)
    end.

lookup(Key) ->
    cc_event:lookup(Key),
    try
	{ok, Pid} = cc_store:lookup(Key),
	{ok, Value} = cc_element:fetch(Pid),
	{ok, Value}
    catch
	_Class:_Exception ->
	    {error, not_found}
    end.

delete(Key) ->
    cc_event:delete(Key),
    case cc_store:lookup(Key) of
	{ok, Pid} ->
	    cc_element:delete(Pid);
	{error, _Reason} ->
	    ok
    end.


%% End of File

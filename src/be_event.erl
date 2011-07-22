%% -*- mode: Erlang; fill-column: 80; comment-column: 70; -*-
%%% -----------------------------------------------------------------------------
%%% be_event.erl
%%% -----------------------------------------------------------------------------
%%% 
%%% @author Ulf Ejlertsson
%%% @copyright Ulf Ejlertsson 2011.
%%% @doc 
%%% @end 
%%% 

-module(be_event).

%-behavior(supervisor|application|gen_server).
-author({ulf, ejlertsson}).
-vsn("0.1.0").

%% Import unit tests.
-include_lib("eunit/include/eunit.hrl").

%% Exports.
-export([
	  start_link/0,
	 add_handler/2,
	 delete_handler/2,
	 lookup/1,
	 create/2,
	 replace/2,
	 delete/1
	]).

-define(SERVER, ?MODULE).

start_link() ->
    gen_event:start_link( {local, ?SERVER} ).

add_handler(Handler, Args) ->
    gen_event:add_handler(?SERVER, Handler, Args).

delete_handler(Handler, Args) ->
    gen_event:delete_handler(?SERVER, Handler, Args).

lookup(Key) ->
    gen_event:notify(?SERVER, {lookup, Key}).

create(Key, Value) ->
    gen_event:notify(?SERVER, {create, {Key, Value}}).

replace(Key, Value) ->
    gen_event:notify(?SERVER, {replace, {Key, Value}}).

delete(Key) ->
    gen_event:notify(?SERVER, {delete, Key}).


%% End of File

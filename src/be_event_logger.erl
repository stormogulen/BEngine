%% -*- mode: Erlang; fill-column: 80; comment-column: 70; -*-
%%% -----------------------------------------------------------------------------
%%% be_event_logger.erl
%%% -----------------------------------------------------------------------------
%%% 
%%% @author Ulf Ejlertsson
%%% @copyright Ulf Ejlertsson 2011.
%%% @doc 
%%% @end 
%%% 

-module(be_event_logger).

-behavior(gen_server).
-author({ulf, ejlertsson}).
-vsn("0.1.0").

%% Import unit tests.
-include_lib("eunit/include/eunit.hrl").

%% API.
-export([add_handler/0, delete_handler/0]).

%% Exports.
-export([
	  init/1,
	 handle_event/2,
	 handle_call/2,
	 handle_info/2,
	 terminate/2,
	 code_change/3
	 ]).

-record(state, {}).

add_handler() ->
    cc_event:add_handler(?MODULE, []).

delete_handler() ->
    cc_event:delete_handler(?MODULE, []).

init([]) ->
    {ok, #state{}}.

handle_event( {create, {Key, Value}}, State) ->
    error_logger:info_msg("create(~w, ~w)~n", [Key, Value]),
    {ok, State};
handle_event( {lookup, Key}, State) ->
    error_logger:info_msg("delete(~w)~n", [Key]),
    {ok, State};
handle_event( {replace, {Key, Value}}, State) ->
    error_logger:info_msg("replace(~w, ~w)~n", [Key, Value]),
    {ok, State}.

handle_call(_Request, State) ->
    Reply = ok,
    {ok, Reply, State}.

handle_info(_Info, State) ->
    {ok, State}.

terminate(_Reaseon, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% End of File

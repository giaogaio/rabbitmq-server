%%% The contents of this file are subject to the Mozilla Public License
%%% Version 1.1 (the "License"); you may not use this file except in
%%% compliance with the License. You may obtain a copy of the License at
%%% http://www.mozilla.org/MPL/
%%%
%%% Software distributed under the License is distributed on an "AS IS"
%%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
%%% License for the specific language governing rights and limitations
%%% under the License.
%%%
%%% The Original Code is RabbitMQ.
%%%
%%% @author Ayanda Dube <ayanda.dube@erlang-solutions.com>
%%% @doc
%%% - Queue Master Location behaviour implementation
%%%
%%% @end
%%% Created : 19. Jun 2015
%%%-------------------------------------------------------------------
-module(rabbit_queue_master_locator).

-ifdef(use_specs).

-callback description()                -> [proplists:property()].
-callback queue_master_location(pid()) -> {'ok', node()} | {'error', term()}.
-callback validate_policy(pid())       -> {'ok', node()} | {'error', term()}.

-else.

-export([behaviour_info/1]).
behaviour_info(callbacks) ->
  [ {description,           0},
    {queue_master_location, 1},
    {validate_policy,       1}];
behaviour_info(_Other) ->
  undefined.

-endif.

(*
 *  This file is part of the Watson Conversation Service OCaml API project.
 *
 * Copyright 2016-2017 IBM Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *)

open Wcs_t

val bypass_default : string -> (bool * 'a) option
val before_default : message_request -> message_request
val after_default : message_response -> message_response
val user_input_default : unit -> string
val matcher_default : message_response -> 'a option

val get_value :
  ?bypass:(string -> (bool * 'a) option) ->
  ?before:(message_request -> message_request) ->
  ?after:(message_response -> message_response) ->
  ?user_input:(unit -> string) ->
  ?matcher:(message_response -> 'a option) ->
  credential -> string -> json -> string -> string option * 'a


val exec :
  ?bypass:(string -> (bool * json) option) ->
  ?before:(message_request -> message_request) ->
  ?after:(message_response -> message_response) ->
  ?user_input:(unit -> string) ->
  credential -> string -> json -> string -> string option * json
(**
   [exec cred ws_id ctx_init txt_init] executes the workspace [ws_id]
   with the initial context [ctx_init] and the initial input text
   [txt_init]. The execution is completed when the field [return] is
   defined in the context.  The return value is the last input string
   if the field [skip_user_input] is defined and thevalue of the field
   [return].
 *)

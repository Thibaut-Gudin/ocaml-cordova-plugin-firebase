[@@@js.stop]

module Properties : sig
  type t

  val create : (string * string) list -> t
end

[@@@js.start]

[@@@js.implem
module Properties = struct
  type t = Ojs.t

  let create ls =
    Ojs.obj
      (Array.of_list (List.map (fun (k, v) -> (k, Ojs.string_to_js v)) ls))

  let t_to_js x = Ojs.t_to_js x
end]

[@@@ocamlformat "disable=true"]

val logEvent : event:string ->
               ?params:(Properties.t [@js.default Properties.create []]) ->
               unit ->
               unit
               [@@js.global "cordova.plugins.firebase.analytics.logEvent"]

[@@@ocamlformat "disable=false"]

val setEnabled : bool -> unit
  [@@js.global "cordova.plugins.firebase.analytics.setEnabled"]

val getAppInstanceId : unit -> string
  [@@js.global "cordova.plugins.firebase.analytics.getAppInstanceId"]

[@@@js.stop]

val available : unit -> bool

val access_analytics : unit -> bool

[@@@js.start]

[@@@js.implem
let available () =
  Js_of_ocaml.Js.Optdef.test
    Js_of_ocaml.Js.Unsafe.global##.cordova##.plugins##.firebase]

[@@@js.implem
let access_analytics () =
  Js_of_ocaml.Js.Optdef.test
    Js_of_ocaml.Js.Unsafe.global##.cordova##.plugins##.firebase##.analytics]

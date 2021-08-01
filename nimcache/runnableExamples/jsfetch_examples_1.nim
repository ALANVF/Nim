#[
autogenerated by docgen
loc: /home/runner/work/Nim/Nim/lib/std/jsfetch.nim(118, 17)
rdoccmd: -d:nimExperimentalJsfetch -r:off
]#
import "/home/runner/work/Nim/Nim/lib/std/jsfetch.nim"
{.line: ("/home/runner/work/Nim/Nim/lib/std/jsfetch.nim", 118, 17).}:
  import std/[asyncjs, jsconsole, jsheaders, jsformdata]
  from std/httpcore import HttpMethod
  from std/jsffi import JsObject
  from std/sugar import `=>`

  block:
    let options0: FetchOptions = unsafeNewFetchOptions(
      metod = "POST".cstring,
      body = """{"key": "value"}""".cstring,
      mode = "no-cors".cstring,
      credentials = "omit".cstring,
      cache = "no-cache".cstring,
      referrerPolicy = "no-referrer".cstring,
      keepalive = false,
      redirect = "follow".cstring,
      referrer = "client".cstring,
      integrity = "".cstring
    )
    assert options0.keepalive == false
    assert options0.metod == "POST".cstring
    assert options0.body == """{"key": "value"}""".cstring
    assert options0.mode == "no-cors".cstring
    assert options0.credentials == "omit".cstring
    assert options0.cache == "no-cache".cstring
    assert options0.referrerPolicy == "no-referrer".cstring
    assert options0.redirect == "follow".cstring
    assert options0.referrer == "client".cstring
    assert options0.integrity == "".cstring

  block:
    let options1: FetchOptions = newFetchOptions(
      metod =  HttpPost,
      body = """{"key": "value"}""".cstring,
      mode = fmNoCors,
      credentials = fcOmit,
      cache = fchNoCache,
      referrerPolicy = frpNoReferrer,
      keepalive = false,
      redirect = frFollow,
      referrer = "client".cstring,
      integrity = "".cstring
    )
    assert options1.keepalive == false
    assert options1.metod == $HttpPost
    assert options1.body == """{"key": "value"}""".cstring
    assert options1.mode == $fmNoCors
    assert options1.credentials == $fcOmit
    assert options1.cache == $fchNoCache
    assert options1.referrerPolicy == $frpNoReferrer
    assert options1.redirect == $frFollow
    assert options1.referrer == "client".cstring
    assert options1.integrity == "".cstring

  block:
    let response: Response = newResponse(body = "-. .. --".cstring)
    let request: Request = newRequest(url = "http://nim-lang.org".cstring)

  if not defined(nodejs):
    block:
      proc doFetch(): Future[Response] {.async.} =
        fetch "https://httpbin.org/get".cstring

      proc example() {.async.} =
        let response: Response = await doFetch()
        assert response.ok
        assert response.status == 200.cint
        assert response.headers is Headers
        assert response.body is Body

      discard example()

    when defined(nimExperimentalAsyncjsThen):
      block:
        proc example2 {.async.} =
          await fetch("https://api.github.com/users/torvalds".cstring)
            .then((response: Response) => response.json())
            .then((json: JsObject) => console.log(json))
            .catch((err: Error) => console.log("Request Failed", err))

        discard example2()


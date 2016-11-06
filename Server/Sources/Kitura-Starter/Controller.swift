import Kitura
import SwiftyJSON
import LoggerAPI
import CloudFoundryEnv

public class Controller {

  let router: Router
  let appEnv: AppEnv

  var port: Int {
    get { return appEnv.port }
  }

  var url: String {
    get { return appEnv.url }
  }

  init() throws {
    appEnv = try CloudFoundryEnv.getAppEnv()
    router = Router()
    router.get("/json", handler: getJSON)
  }

  public func getJSON(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    Log.debug("GET - /json route handler...")
    response.headers["Content-Type"] = "application/json; charset=utf-8"
    var jsonResponse = JSON([:])
    jsonResponse["hello"].stringValue = "world"
    try response.status(.OK).send(json: jsonResponse).end()
  }
}

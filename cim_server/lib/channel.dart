import 'cim_server.dart';


//////////////////////////////////cim_appuser2021
/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class CimServerChannel extends ApplicationChannel {
  ManagedContext context;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    var dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    var psc = PostgreSQLPersistentStore.fromConnectionInfo("postgres","", "45.86.183.140", 5432, "postgres");
    context = ManagedContext(dataModel, psc);
    bool flag = psc.isConnected;
    int i =0;
    i++;
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    router
      .route("checkConnection")
      .link(() => CheckConnectionController());

    return router;
  }
}

class CheckConnectionController extends Controller{

  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    return Response.ok(null);
  }
}
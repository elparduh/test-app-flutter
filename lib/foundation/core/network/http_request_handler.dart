import 'dart:io';

import 'package:http/http.dart';
import 'package:test_app_flutter/foundation/core/network/http_request_status.dart';

class HttpRequestHandler {

  HttpRequestStatus createRequestStatus(Response response) =>
      switch (response.statusCode) {
        200 => const SuccessfulRequest(),
        _ => Unknown(response.body)
      };

  HttpRequestStatus createRequestStatusFrom(Exception exception) =>
      switch (exception) {
        SocketException() => const ConnectionNetwork(),
        _ => Unknown(exception.toString())
      };
}

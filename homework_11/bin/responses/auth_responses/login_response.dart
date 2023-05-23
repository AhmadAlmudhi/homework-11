import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../response_messages/bad_request.dart';
import '../../services/supabase/supabase_env.dart';


loginHandler(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    if (body["email"] == null || body["password"] == null) {
      return Response.badRequest(body: "add email and password please");
    }
    final auth = SupabaseEnv().supabase.auth;
    final userLogin = await auth.signInWithPassword(
      email: body["email"],
      password: body["password"],
    );

    return Response.ok(userLogin.session?.accessToken.toString());
  
  } catch (error) {
    
     return BadRequest().responseMessage(message: "oops! Wrong login");
  }
}

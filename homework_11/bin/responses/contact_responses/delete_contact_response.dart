import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../response_messages/bad_request.dart';
import '../../response_messages/success.dart';
import '../../services/supabase/supabase_env.dart';

deleteContactHandler(Request req, String id) async {
  try {
    final jwt = JWT.decode(req.headers["authorization"]!);
    final supabase = SupabaseEnv().supabase;

//-------------- get id from table user by  id auth
    final result = await supabase
        .from("users")
        .select("id")
        .eq("id_auth", jwt.payload["sub"]);

//-------------- get all from table contact by  id 
    final contactInfo =
        await supabase.from("contact").select().eq("id_user", result[0]["id"]);

//-------------- delete contact by id 
    await supabase
        .from("contact")
        .delete()
        .eq("id_user", result[0]["id"])
        .eq("id", int.parse(id));

    return Success().responseMessage(
      message: "Contact information has been removed ! ",
      data: {"contact": contactInfo},
    );
  } catch (error) {
    return BadRequest().responseMessage(
      message: "Oops! Wrong! contact information was not deleted",
    );
  }
}


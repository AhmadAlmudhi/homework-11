import 'package:supabase/supabase.dart';

class SupabaseEnv {
  final _url = "";
  final _key =
      "";
  final _jwt =
      '';

  get jwt {
    return _jwt;
  }

  SupabaseClient get supabase {
    return SupabaseClient(_url, _key);
  }
}

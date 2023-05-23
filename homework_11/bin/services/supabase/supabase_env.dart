import 'package:supabase/supabase.dart';

class SupabaseEnv {
  final _url = "https://abztaxrlmeshodancbpd.supabase.co";
  final _key =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFienRheHJsbWVzaG9kYW5jYnBkIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NDIzMDcyOSwiZXhwIjoxOTk5ODA2NzI5fQ.ELHbLxCmiwGEpT-ezz-Shi3oomSeIeneTiobLzFjNnY";
  final _jwt =
      'mX6BruxRJfaD2i6ubkbFRMoE3rqpOOZ0ZkHSNljjBhyaU1GjH7pvNghg4FcjR3MpJp6ZixtGC0QLrLxMP2uGMQ==';

  get jwt {
    return _jwt;
  }

  SupabaseClient get supabase {
    return SupabaseClient(_url, _key);
  }
}

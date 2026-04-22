import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient _client = Supabase.instance.client;

  // GET all data
  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final response = await _client.from(table).select();
    return response.map((e) => e as Map<String, dynamic>).toList();
  }

  // GET with filter
  static Future<List<Map<String, dynamic>>> getWhere(
    String table,
    String column,
    dynamic value,
  ) async {
    final response = await _client.from(table).select().eq(column, value);
    return response.map((e) => e as Map<String, dynamic>).toList();
  }

  // INSERT
  static Future<void> insert(String table, Map<String, dynamic> data) async {
    await _client.from(table).insert(data);
  }

  // UPDATE
  static Future<void> update(
    String table,
    String idColumn,
    dynamic idValue,
    Map<String, dynamic> data,
  ) async {
    await _client.from(table).update(data).eq(idColumn, idValue);
  }

  // DELETE
  static Future<void> delete(
    String table,
    String idColumn,
    dynamic idValue,
  ) async {
    await _client.from(table).delete().eq(idColumn, idValue);
  }

  // LOGIN ADMIN
  static Future<Map<String, dynamic>?> loginAdmin(
      String username, String password) async {
    final result = await _client
        .from('user_admin')
        .select()
        .eq('username', username)
        .eq('password', password)
        .maybeSingle();

    return result;
  }
}

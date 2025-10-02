// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../../../utils/result.dart';
import 'auth_repository.dart';

/// Simple auth repository that requires login but accepts any credentials.
/// Shows login screen on startup, accepts any email/password combination.
class AuthRepositorySimple extends AuthRepository {
  bool _isAuthenticated = false;

  /// User starts as not authenticated, must login first
  @override
  Future<bool> get isAuthenticated => Future.value(_isAuthenticated);

  /// Login is always successful regardless of credentials
  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) async {
    _isAuthenticated = true;
    notifyListeners();
    return const Result.ok(null);
  }

  /// Logout sets authenticated to false
  @override
  Future<Result<void>> logout() async {
    _isAuthenticated = false;
    notifyListeners();
    return const Result.ok(null);
  }
}

import 'package:at_client/at_client.dart';
import 'package:meta/meta.dart';
import 'package:noports_core/admin.dart';

abstract interface class PolicyService {
  /// initialize the policy service once it's been created
  Future<void> init();

  /// The in-memory groups map. Not for external use.
  @visibleForTesting
  Map<String, UserGroup> get groups;

  /// The in-memory list of log events. Not for external use.
  @visibleForTesting
  List<dynamic> get logEvents;

  Stream<String> get eventStream;

  // TODO Use a PolicyLogEvent
  /// Fetch some log events
  Future<List<dynamic>> getLogEvents({required int from, required int to});

  /// Get (some of) the permission groups known to this policy service.
  /// Method rather than getter, as we will add query parameters later
  Future<List<UserGroup>> getUserGroups();

  /// Get a group object by its ID
  Future<UserGroup?> getUserGroup(String id);

  /// Create a group. Must not already have an `id`
  Future<UserGroup> createUserGroup(UserGroup group);

  /// Update a group. Must already have an `id`
  Future<void> updateUserGroup(UserGroup group);

  /// Delete a group.
  /// Return true if deleted, false if not.
  Future<bool> deleteUserGroup(String id);

  /// Get the list of groups of which this user is a member.
  Future<List<UserGroup>> getGroupsForUser(String atSign);

  Set<String> get daemonAtSigns;

  factory PolicyService.withAtClient({
    required AtClient atClient,
  }) {
    return PolicyServiceWithAtClient(
      atClient: atClient,
    );
  }
  factory PolicyService.inMemory() {
    return PolicyServiceInMem();
  }
}

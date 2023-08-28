import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import 'package:tui_lib/tui_lib.dart';

part 'project.g.dart';

class ProjectProxy {
  ProjectProxy({
    required this.projectCache,
    required this.king,
  });
  final Cache<Project> projectCache;
  final King king;

  Project getById(
    String projectId, {
    bool disableApi = false,
    bool forceApi = false,
  }) {
    if (!disableApi) {
      projectCache.apiGetById(
          url: EndpointsV2.projectGetById,
          idName: 'ProjectId',
          id: projectId,
          forceApi: forceApi);
    }

    return projectCache.getItem(projectId);
  }

  static ProjectProxy of(BuildContext context) {
    return King.of(context).lad.projectProxy;
  }
}

class Project = ProjectBase with _$Project;

abstract class ProjectBase with Store {
  @observable
  String projectId = '';
  @observable
  String creatorId = '';
  @observable
  String planId = '';
  @observable
  String planIdNext = '';
  @observable
  String probiusId = '';

  @observable
  String name = '';
  @observable
  String notes = '';
  @observable
  int timePlanExpires = 0;
  @observable
  int timeCreated = 0;

  bool isLoaded = false;

  void clear() {
    projectId = '';
    creatorId = '';
    timeCreated = 0;
    name = '';
    planId = '';
    planIdNext = '';
  }

  static Project unpackById(Map<String, dynamic> body, Project tt) {
    tt.projectId = readString(body, 'ProjectId');
    tt.creatorId = readString(body, 'CreatorId');
    tt.planId = readString(body, 'PlanId');
    tt.planIdNext = readString(body, 'PlanIdNext');
    tt.probiusId = readString(body, 'ProbiusId');

    tt.name = readString(body, 'Name');
    tt.notes = readString(body, 'Notes');
    tt.timePlanExpires = readInt(body, 'TimePlanExpires');
    tt.timeCreated = readInt(body, 'TimeCreated');

    tt.isLoaded = true;
    return tt;
  }

  static copier(Project dest, Project alt) {
    dest.loadFromAltProject(alt);
  }

  void loadFromAltProject(Project alt) {
    projectId = alt.projectId;
    creatorId = alt.creatorId;
    planId = alt.planId;
    planIdNext = alt.planIdNext;
    probiusId = alt.probiusId;

    name = alt.name;
    notes = alt.notes;
    timePlanExpires = alt.timePlanExpires;
    timeCreated = alt.timeCreated;

    isLoaded = true;
  }

  @computed
  String get timePlanExpiresForDisplay {
    if (timePlanExpires == 0) {
      return 'N/A';
    }
    return DateFormat.yMMMMd('en_US')
        .format(DateTime.fromMillisecondsSinceEpoch(timePlanExpires * 1000));
  }

  @computed
  bool get mustChangePlanNow {
    return planId == '';
  }

  @computed
  bool get isPlanChanging {
    return planId != planIdNext;
  }
}

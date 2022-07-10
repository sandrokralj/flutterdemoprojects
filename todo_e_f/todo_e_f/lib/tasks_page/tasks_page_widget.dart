import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../print_label_page/print_label_page_widget.dart';
import '../signing_doc_page/signing_doc_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TasksPageWidget extends StatefulWidget {
  const TasksPageWidget({
    Key key,
    this.todoItem,
    this.todoSteps,
  }) : super(key: key);

  final TasksRecord todoItem;
  final String todoSteps;

  @override
  _TasksPageWidgetState createState() => _TasksPageWidgetState();
}

class _TasksPageWidgetState extends State<TasksPageWidget> {
  Map<TasksRecord, bool> checkboxListTileValueMap = {};
  List<TasksRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  PagingController<DocumentSnapshot, TasksRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1F24),
        automaticallyImplyLeading: true,
        title: Text(
          FFLocalizations.of(context).getText(
            'tf2idhub' /* Tasks */,
          ),
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: LinearPercentIndicator(
                      percent: 0.5,
                      width: MediaQuery.of(context).size.width * 0.8,
                      lineHeight: 25,
                      animation: true,
                      progressColor: Color(0xFFCFD8DC),
                      backgroundColor: Color(0xFF607D8B),
                      center: Text(
                        FFLocalizations.of(context).getText(
                          'u97c51yd' /* 50% */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF1A1F24),
                            ),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
                PagedListView<DocumentSnapshot<Object>, TasksRecord>(
                  pagingController: () {
                    final Query<Object> Function(Query<Object>) queryBuilder =
                        (tasksRecord) => tasksRecord;
                    if (_pagingController != null) {
                      final query = queryBuilder(TasksRecord.collection);
                      if (query != _pagingQuery) {
                        // The query has changed
                        _pagingQuery = query;
                        _streamSubscriptions.forEach((s) => s?.cancel());
                        _streamSubscriptions.clear();
                        _pagingController.refresh();
                      }
                      return _pagingController;
                    }

                    _pagingController = PagingController(firstPageKey: null);
                    _pagingQuery = queryBuilder(TasksRecord.collection);
                    _pagingController.addPageRequestListener((nextPageMarker) {
                      queryTasksRecordPage(
                        queryBuilder: (tasksRecord) => tasksRecord,
                        nextPageMarker: nextPageMarker,
                        pageSize: 25,
                        isStream: true,
                      ).then((page) {
                        _pagingController.appendPage(
                          page.data,
                          page.nextPageMarker,
                        );
                        final streamSubscription =
                            page.dataStream?.listen((data) {
                          final itemIndexes = _pagingController.itemList
                              .asMap()
                              .map((k, v) => MapEntry(v.reference.id, k));
                          data.forEach((item) {
                            final index = itemIndexes[item.reference.id];
                            final items = _pagingController.itemList;
                            if (index != null) {
                              items.replaceRange(index, index + 1, [item]);
                              _pagingController.itemList = {
                                for (var item in items) item.reference: item
                              }.values.toList();
                            }
                          });
                          setState(() {});
                        });
                        _streamSubscriptions.add(streamSubscription);
                      });
                    });
                    return _pagingController;
                  }(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  builderDelegate: PagedChildBuilderDelegate<TasksRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: SpinKitCubeGrid(
                          color: Color(0xFFCFD8DC),
                          size: 50,
                        ),
                      ),
                    ),

                    itemBuilder: (context, _, listViewIndex) {
                      final listViewTasksRecord =
                          _pagingController.itemList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: checkboxListTileValueMap[
                                listViewTasksRecord] ??= false,
                            onChanged: (newValue) => setState(() =>
                                checkboxListTileValueMap[listViewTasksRecord] =
                                    newValue),
                            title: Text(
                              listViewTasksRecord.taskDescription,
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF101213),
                                      ),
                            ),
                            subtitle: Text(
                              dateTimeFormat(
                                  'MMMMEEEEd', listViewTasksRecord.dateCreated),
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor: Color(0xFF4099F7),
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SigningDocPageWidget(),
                        ),
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'h1buynfe' /* Sign the document */,
                    ),
                    options: FFButtonOptions(
                      width: 180,
                      height: 40,
                      color: Color(0xFF607D8B),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrintLabelPageWidget(),
                        ),
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      '17z6zls1' /* Print the label */,
                    ),
                    options: FFButtonOptions(
                      width: 180,
                      height: 40,
                      color: Color(0xFF607D8B),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

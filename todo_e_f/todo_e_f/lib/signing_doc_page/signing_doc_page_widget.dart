import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signature/signature.dart';

class SigningDocPageWidget extends StatefulWidget {
  const SigningDocPageWidget({Key key}) : super(key: key);

  @override
  _SigningDocPageWidgetState createState() => _SigningDocPageWidgetState();
}

class _SigningDocPageWidgetState extends State<SigningDocPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  SignatureController signatureController;

  @override
  void initState() {
    super.initState();
    signatureController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
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
            'rhv502yo' /* Sign the document */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: ClipRect(
                  child: Signature(
                    controller: signatureController,
                    backgroundColor: Colors.white,
                    height: 220,
                  ),
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  '7y8cv5jy' /* Submit */,
                ),
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Color(0xFF607D8B),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
            ],
          ),
        ),
      ),
    );
  }
}

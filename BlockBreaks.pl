#!/usr/bin/perl

use strict;
use OpenGL ':all';

use Scene;

use constant APP_NAME => 'Block Breaks';

our $scene = new Scene;

# GLUTの初期化
glutInit();
# ダブルバッファモードに設定
glutInitDisplayMode( GLUT_DOUBLE );
# ウィンドウの作成
glutCreateWindow( APP_NAME );
# 画面描画に使用する関数を設定
glutDisplayFunc( \&draw );
glutIdleFunc( sub{ glutPostRedisplay(); } );
# メッセージループ
glutMainLoop();




sub draw
{
	# 画面のクリア
	glClear( GL_COLOR_BUFFER_BIT );
	
	# 描画の開始
	glBegin( GL_TRIANGLES );

	$scene->draw();
	
	# 描画の終了
	glEnd();
	
	# 更新
	glutSwapBuffers();
}
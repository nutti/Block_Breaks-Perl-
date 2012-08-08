#!/usr/bin/perl

use strict;
use OpenGL ':all';

use Scene;

use constant APP_NAME => 'Block Breaks';

our $scene = new Scene;

# GLUT�̏�����
glutInit();
# �_�u���o�b�t�@���[�h�ɐݒ�
glutInitDisplayMode( GLUT_DOUBLE );
# �E�B���h�E�̍쐬
glutCreateWindow( APP_NAME );
# ��ʕ`��Ɏg�p����֐���ݒ�
glutDisplayFunc( \&draw );
glutIdleFunc( sub{ glutPostRedisplay(); } );
# ���b�Z�[�W���[�v
glutMainLoop();




sub draw
{
	# ��ʂ̃N���A
	glClear( GL_COLOR_BUFFER_BIT );
	
	# �`��̊J�n
	glBegin( GL_TRIANGLES );

	$scene->draw();
	
	# �`��̏I��
	glEnd();
	
	# �X�V
	glutSwapBuffers();
}
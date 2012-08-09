#!/usr/bin/perl

use strict;
use OpenGL ':all';

use Scene;
use SceneBuilder;

use constant APP_NAME				=> 'Block Breaks';		# �E�B���h�E��
use constant WINDOW_INITIAL_POS_X	=> 100;					# �E�B���h�E�̏����ʒu�iX���W�j
use constant WINDOW_INITIAL_POS_Y	=> 100;					# �E�B���h�E�̏����ʒu�iY���W�j
use constant WINDOW_WIDTH			=> 640;					# �E�B���h�E�̕�
use constant WINDOW_HEIGHT			=> 480;					# �E�B���h�E�̍���

# �O���[�o���ϐ�
our $scene_builder = new SceneBuilder;
our $scene = $scene_builder->create_scene( SceneBuilder::SCENE_STAGE );


# GLUT�̏�����
glutInit();
# �_�u���o�b�t�@���[�h�ɐݒ�
glutInitDisplayMode( GLUT_RGBA | GLUT_DOUBLE );
# �E�B���h�E�̍쐬
glutInitWindowPosition( WINDOW_INITIAL_POS_X, WINDOW_INITIAL_POS_Y );
glutInitWindowSize( WINDOW_WIDTH, WINDOW_HEIGHT );
glutCreateWindow( APP_NAME );
# �T�C�Y���ύX���ꂽ���ɌĂяo�����֐���ݒ�
glutReshapeFunc( \&resize );
# ��ʕ`��Ɏg�p����֐���ݒ�
glutDisplayFunc( \&draw );
glutIdleFunc( sub{ glutPostRedisplay(); } );
# ���b�Z�[�W���[�v
glutMainLoop();


sub resize
{
	# �E�B���h�E�T�C�Y�̌Œ艻
	glutReshapeWindow( WINDOW_WIDTH, WINDOW_HEIGHT );
}

# �`��J�n
sub begin_rendering
{
	# ��ʃT�C�Y��߂�
	&resize;

	# ��ʂ̃N���A
	glClear( GL_COLOR_BUFFER_BIT );
	
	# �J�����̐ݒ�
	glMatrixMode( GL_PROJECTION );
	glPushMatrix();
	glOrtho( 0, WINDOW_WIDTH, WINDOW_HEIGHT, 0, -1, 1 );
	glMatrixMode( GL_MODELVIEW );
	glPushMatrix();
	glLoadIdentity();
}

# �`��I��
sub end_rendering
{
	# �J�����̐ݒ����
	glMatrixMode( GL_PROJECTION );
	glPopMatrix();
	glMatrixMode( GL_MODELVIEW );
	glPopMatrix();
	
	# �X�V
	glutSwapBuffers();
}

sub draw
{
	# �`��J�n
	&begin_rendering;
	
	# �`��̊J�n
	glBegin( GL_TRIANGLES );

	$scene->draw();
	
	
	# �`��̏I��
	glEnd();
	
	# �`��I��
	&end_rendering;
}
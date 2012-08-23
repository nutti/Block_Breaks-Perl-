#!/usr/bin/perl

use strict;
use OpenGL ':all';
use Time::HiRes 'sleep';
use Readonly;

use SceneBuilder;
use FPSManager;
use InputManager;

use constant APP_NAME				=> 'Block Breaks';		# �E�B���h�E��
Readonly my $WINDOW_INITIAL_POS_X	=> 100;					# �E�B���h�E�̏����ʒu�iX���W�j
use constant WINDOW_INITIAL_POS_Y	=> 100;					# �E�B���h�E�̏����ʒu�iY���W�j
use constant WINDOW_WIDTH			=> 640;					# �E�B���h�E�̕�
use constant WINDOW_HEIGHT			=> 480;					# �E�B���h�E�̍���

# �O���[�o���ϐ�
our $scene_builder = new SceneBuilder;
our $scene = $scene_builder->create_scene( $SceneBuilder::SCENE_STAGE );
our $fps_manager = new FPSManager( 60 );
our $input_manager = new InputManager();

our @keys = ();
$#keys = 256;

# GLUT�̏�����
glutInit();
# �_�u���o�b�t�@���[�h�ɐݒ�
glutInitDisplayMode( GLUT_RGBA | GLUT_DOUBLE );
# �E�B���h�E�̍쐬
glutInitWindowPosition( $WINDOW_INITIAL_POS_X, WINDOW_INITIAL_POS_Y );
glutInitWindowSize( WINDOW_WIDTH, WINDOW_HEIGHT );
glutCreateWindow( APP_NAME );
# �T�C�Y���ύX���ꂽ���ɌĂяo�����֐���ݒ�
glutReshapeFunc( \&resize );
# ��ʕ`��Ɏg�p����֐���ݒ�
glutDisplayFunc( \&draw );
glutIdleFunc( \&idle );
# �L�[�{�[�h���͎擾�֐���ݒ�
glutKeyboardFunc( \&keyboard );
# �}�E�X���͎擾�֐���ݒ�
glutPassiveMotionFunc( \&mouse );
# ���b�Z�[�W���[�v
glutMainLoop();

# �L�[�{�[�h���͎擾�֐�
sub keyboard
{
	# ���͂��ꂽ�L�[�R�[�h��ʒm
	my ( $key, $x, $y ) = @_;
	$input_manager->notify_key_input( $key );
}

# �}�E�X���͎擾�֐�
sub mouse
{
	# ���͂��ꂽ�}�E�X�̏�Ԃ�ʒm
	my ( $x, $y ) = @_;
	$input_manager->notify_mouse_input( $x, $y );
}

sub idle
{
	if( $fps_manager->has_elasped() == 1 ){
		glutPostRedisplay();
	}
	else{
		Time::HiRes::sleep( 0.01 );
	}
}

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
	
	# �L�[���͂̏�Ԃ��N���A
	$input_manager->clear();
}

our $count = 0;
our @digit = ();


# �`��֐�
sub draw
{
	# �`��J�n
	&begin_rendering;
	
	# �V�[���̍X�V
	$scene->update( $input_manager );
	# �V�[���̕`��
	$scene->draw();
	
	# FPS�l�`��
	++$count;
	if( ( $count % 60 ) == 0 ){
		my $fps = $fps_manager->get_fps();
		@digit[ 0 ] = ( $fps * 10 ) % 10;
		@digit[ 2 ] = $fps / 10;
		@digit[ 1 ] = $fps % 10;
	}
	if( $input_manager->is_pushed( 122 ) == 1 ){
		glRasterPos2f( 550.0, 440.0 );
		glutBitmapCharacter( GLUT_BITMAP_HELVETICA_18, ord $digit[ 2 ] );
		glRasterPos2f( 560.0, 440.0 );
		glutBitmapCharacter( GLUT_BITMAP_HELVETICA_18, ord $digit[ 1 ] );
		glRasterPos2f( 570.0, 440.0 );
		glutBitmapCharacter( GLUT_BITMAP_HELVETICA_18, ord '.' );
		glRasterPos2f( 580.0, 440.0 );
		glutBitmapCharacter( GLUT_BITMAP_HELVETICA_18, ord $digit[ 0 ] );
	}
	
	# �`��I��
	&end_rendering;

}
#!/usr/bin/perl

use strict;
use OpenGL ':all';

package Scene;

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $scene = {};
	
	# �X�e�[�g�}�V���̍\�z
	#$scene->{Stage} = new Stage
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $scene, $this;
	
	return $scene;
}

sub draw
{
	main::glVertex2f( 10.0, 10.0 );
	main::glVertex2f( 50.0, 50.0 );
	main::glVertex2f( 30.0, 70.0 );
}

sub update
{
}

# ���̃V�[���Ɉڍs
sub set_next_scene
{
	
}

1;
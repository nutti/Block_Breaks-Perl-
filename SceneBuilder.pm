#!/usr/bin/perl

# �V�[���\�z�N���X

package SceneBuilder;

use strict;
use Scene;

use constant SCENE_STAGE	=> 1;

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $scene_builder = {};
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $scene_builder, $this;
	
	return $scene_builder;
}


# ���̃V�[���Ɉڍs
sub create_scene
{
	my $next_scene = shift;
	return new Scene;
}

1;
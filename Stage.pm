#!/usr/bin/perl

package Stage;

use strict;
use OpenGL ':all';

use base qw(Scene);
use NormalPlayer;

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $stage = {};
	$stage->{player} = new NormalPlayer;
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $stage, $this;
	
	return $stage;
}

sub draw
{
	my $this = shift;
	
	$this->{player}->draw();
}

sub update
{
}

# ���̃V�[���Ɉڍs
sub set_next_scene
{
	
}

1;
#!/usr/bin/perl

package Stage;

use strict;
use OpenGL ':all';

use base qw(Scene);
use NormalPlayer;
use NormalBall;


use NormalBlock;

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $stage = {};
	$stage->{player} = new NormalPlayer;
	$stage->{ball} = new NormalBall;
	$stage->{block} = new NormalBlock( 3, 3 );
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $stage, $this;
	
	return $stage;
}

sub draw
{
	my $this = shift;
	
	$this->{player}->draw();
	$this->{ball}->draw();
	$this->{block}->draw();
}

sub update
{
	my $this = shift;
	my $input_manager = shift;
	
	$this->{player}->update( $input_manager );
	$this->{ball}->update();
	if( $this->{ball}->is_collided( $this->{player} ) ){
		$this->{ball}->process_collision_with_player();
	}
}

# ���̃V�[���Ɉڍs
sub set_next_scene
{
	
}

1;
#!/usr/bin/perl

package Block;

use strict;
use OpenGL ':all';
use Readonly;

Readonly our $OFFSET_X		=> 50;	# �u���b�N�̍ō��[
Readonly our $OFFSET_Y		=> 30;	# �u���b�N�̍ŏ�[
Readonly our $WIDTH			=> 25;	# �u���b�N�̕�
Readonly our $HEIGHT			=> 15;	# �u���b�N�̍���
Readonly our $INTERVAL_X		=> 5;	# �u���b�N�Ԃ̕�
Readonly our $INTERVAL_Y		=> 5;	# �u���b�N�Ԃ̍���

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $block = {};
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $block, $this;
	
	return $block;
}

# �`��
sub draw
{
}

# �X�V
sub update
{
}

# X���W���擾����
sub get_pos_x
{
}

# Y���W���擾����
sub get_pos_y
{
}

# �����擾����
sub get_width
{
}

# �������擾����
sub get_height
{
}

# �j�󂳂ꂽ��
sub destroyed
{
}

# �ђʂ��邩
sub penetrate
{
}

# �{�[���ƏՓ˂������̏���
sub process_collision_with_ball
{
}

# �X�R�A���擾
sub get_score
{
}

1;
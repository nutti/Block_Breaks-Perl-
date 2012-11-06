#!/usr/bin/perl

package BlankBlock;

use strict;
use OpenGL ':all';
use Util;

use base qw(Block CollisionObj);


# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	# �u���b�N�̏ꏊ���擾
	my $row = shift;
	my $column = shift;
	
	# �����o�ϐ�
	my $block = {};
	$block->{pos_x} = ( $Block::WIDTH + $Block::INTERVAL_X ) * $row + $Block::OFFSET_X;
	$block->{pos_y} = ( $Block::HEIGHT + $Block::INTERVAL_Y ) * $column + $Block::OFFSET_Y;
	$block->{destroyed} = $Util::TRUE;
	$block->{penetrate} = $Util::TRUE;
	$block->{score} = 0;
	
	
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
	my $this = shift;
	
	return $this->{destroyed};
}

# �ђʂ��邩
sub penetrate
{
	my $this = shift;
	
	return $this->{penetrate};
}

# �{�[���ƏՓ˂������̏���
sub process_collision_with_ball
{
}

# ���_���擾
sub get_score
{
	my $this = shift;
	
	return $this->{score};
}

1;
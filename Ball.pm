#!/usr/bin/perl

use strict;
use OpenGL ':all';

package Ball;

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $ball = {};
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $ball, $this;
	
	return $ball;
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

# �v���C���[�Ƃ̏Փ˔���
sub collision_with_player
{
}


1;
#!/usr/bin/perl

use strict;
use OpenGL ':all';

package Player;

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $scene = {};
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $scene, $this;
	
	return $scene;
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

1;
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
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $scene, $this;
	
	return $scene;
}

sub draw
{
	main::glVertex2f( -0.5, 0.5 );
	main::glVertex2f( -0.5, -0.5 );
	main::glVertex2f( 0.9, 0 );
}

1;
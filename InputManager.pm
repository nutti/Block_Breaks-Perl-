#!/usr/bin/perl

use strict;

package InputManager;

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $input_manager = {};
	my @keys = ();
	$#keys = 256;
	$input_manager->{keys} = \@keys;
	$input_manager->{mouse_pos_x} = 0;
	$input_manager->{mouse_pos_y} = 0;
	$input_manager->{button} = 200;
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $input_manager, $this;
	
	return $input_manager;
}

# �L�[�����͂��ꂽ���Ƃ�ʒm
sub notify_key_input
{
	my $this = shift;
	my $code = shift;
	
	@{$this->{keys}}[ $code ] = 1;
}

# �}�E�X�����͂��ꂽ���Ƃ�ʒm
sub notify_mouse_input
{
	my $this = shift;
	my $x = shift;
	my $y = shift;
	
	$this->{mouse_pos_x} = $x;
	$this->{mouse_pos_y} = $y;
}

# �}�E�X���N���b�N���ꂽ���Ƃ�ʒm
sub notify_mouse_click
{
	my $this = shift;
	my $button = shift;
	
	$this->{button} = $button;
}

# �����̃}�E�X���N���b�N���ꂽ���H
sub is_mouse_left_clicked
{
	my $this = shift;
	
	return $this->{button} == 0;
}


# �L�[��������Ă��邩�H
sub is_pushed
{
	my $this = shift;
	my $code = shift;
	
	return @{$this->{keys}}[ $code ];
}

# �L�[�̓��͏�Ԃ�������
sub clear
{
	my $this = shift;
	
	for( my $i = 0; $i < 256; ++$i ){
		@{$this->{keys}}[ $i ] = 0;
	}
	
	$this->{button} = 200;
}

# �L�[�̏�Ԃ𓾂�
sub get_key_state
{
	my $this = shift;
	
	return @{$this->{keys}};
}

# �}�E�X��X�����̈ړ��ʂ𓾂�
sub get_mouse_pos_x
{
	my $this = shift;
	
	return $this->{mouse_pos_x};
}

# �}�E�X��Y�����̈ړ��ʂ𓾂�
sub get_mouse_pos_y
{
	my $this = shift;
	
	return $this->{mouse_pos_y};
}


1;
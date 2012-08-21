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
}

# �L�[�̏�Ԃ𓾂�
sub get_key_state
{
	my $this = shift;
	
	return @{$this->{keys}};
}

1;
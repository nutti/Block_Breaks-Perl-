#!/usr/bin/perl

use strict;
use Time::HiRes;

package FPSManager;

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $fps_manager = {};
	$fps_manager->{cur_time} = 0.0;
	my @time = ();
	$fps_manager->{prev_time} = Time::HiRes::time * 1000;
	$fps_manager->{target_fps} = shift;
	$fps_manager->{cur_fps} = 0.0;
	# 1�t���[���ɕK�v�Ȏ��Ԃ��v�Z�B
	$fps_manager->{time_needed_per_frame} = int( 1000.0 / $fps_manager->{target_fps} );
	$fps_manager->{next_time} = $fps_manager->{time_needed_per_frame};
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $fps_manager, $this;
	
	return $fps_manager;
}

# ���t���[���Ɉڍs����܂ł̎��Ԃ��o�߂������H
sub has_elasped
{
	my $this = shift;
	
	# ���ݎ������擾
	$this->{cur_time} = Time::HiRes::time * 1000;
#	print $this->{cur_time} . "\n";
	
	# �o�ߎ��Ԃ��v�Z
	my $elasped_time = ( $this->{cur_time} - $this->{prev_time} );
	# ���Ɍo�߂����ׂ����Ԃ��߂����ꍇ�B
	if( $elasped_time >= $this->{next_time} ){
		# ���ɖڕW�Ƃ��鎞�Ԃ�ݒ�
		$this->{next_time} = $this->{time_needed_per_frame} - ( $elasped_time - $this->{next_time} );
		if( $this->{next_time} < 0 ){
			$this->{next_time} = $this->{time_needed_per_frame};
		}
		# ���݂�FPS�l�𑪒�
		$this->{cur_fps} = 1000.0 / ( $this->{cur_time} - $this->{prev_time} );
		# �����̍X�V
		$this->{prev_time} = $this->{cur_time};
		
		return 1;
	}
	
	return 0;
}

# ���݂�FPS�l���擾����
sub get_fps
{
	my $this = shift;

	return $this->{cur_fps};
}

1;
#!/usr/bin/perl

package CollisionObj;

use strict;
use Readonly;

Readonly our $INTERSECT_TOP		=> 1 << 0;
Readonly our $INTERSECT_BOTTOM	=> 1 << 1;
Readonly our $INTERSECT_LEFT	=> 1 << 2;
Readonly our $INTERSECT_RIGHT	=> 1 << 3;

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	
	# �����o�ϐ�
	my $col_obj = {};
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $col_obj, $this;
	
	return $col_obj;
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

# �Փ˂��Ă��邩�H
sub is_collided
{
	my $self = shift;		# �������g
	my $peer = shift;		# ����
	
	my $result = 0;
	
	# �������g�̓����蔻��
	my $self_top = $self->get_pos_y();
	my $self_bottom = $self->get_pos_y() + $self->get_height();
	my $self_left = $self->get_pos_x();
	my $self_right = $self->get_pos_x() + $self->get_width();
	
	# ����̓����蔻��
	my $peer_top = $peer->get_pos_y();
	my $peer_bottom = $peer->get_pos_y() + $peer->get_height();
	my $peer_left = $peer->get_pos_x();
	my $peer_right = $peer->get_pos_x() + $peer->get_width();
	
	# ��ӂ�����
	if( $peer_top > $self_top && $peer_top < $self_bottom && $peer_left < $self_right && $peer_right > $self_left ){
		$result |= $INTERSECT_TOP;
	}
	# ���ӂ�����
	if( $peer_bottom > $self_top && $peer_bottom < $self_bottom && $peer_left < $self_right && $peer_right > $self_left ){
		$result |= $INTERSECT_BOTTOM;
	}
	# ���ӂ�����
	if( $peer_left > $self_left && $peer_left < $self_right && $peer_top < $self_bottom && $peer_bottom > $self_top ){
		$result |= $INTERSECT_LEFT;
	}
	# �E�ӂ�����
	if( $peer_right > $self_left && $peer_right < $self_right && $peer_top < $self_bottom && $peer_bottom > $self_top ){
		$result |= $INTERSECT_RIGHT;
	}
	
	return $result;
}

sub intersect_at_top
{
	my $this = shift;
	my $value = shift;
	
	return ( $value & $INTERSECT_TOP ) != 0;
}

sub intersect_at_bottom
{
	my $this = shift;
	my $value = shift;
	
	return ( $value & $INTERSECT_BOTTOM ) != 0;
}

sub intersect_at_left
{
	my $this = shift;
	my $value = shift;
	
	return ( $value & $INTERSECT_LEFT ) != 0;
}

sub intersect_at_right
{
	my $this = shift;
	my $value = shift;
	
	return ( $value & $INTERSECT_RIGHT ) != 0;
}




1;
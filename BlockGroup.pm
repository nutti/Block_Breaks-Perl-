#!/usr/bin/perl

package BlockGroup;

use strict;
use OpenGL ':all';

use BlankBlock;
use NormalBlock;
use FragileBlock;
use UnbreakableBlock;
use StrongBlock;

# �R���X�g���N�^
sub new
{
	# �p�b�P�[�W��
	my $this = shift;
	my $stage_file_name = shift;
	
	# �����o�ϐ�
	my $block = {};
	my @blocks = ();
	$#blocks = 13 * 20 - 1;
	$block->{blocks} = \@blocks;
	
	# �t�@�C������X�e�[�W�f�[�^��ǂݍ���
	my @block_pattern = ();
	open FIN, "< $stage_file_name" || die "Failed to open " . $stage_file_name . ".\n";
	while( <FIN> ){
		chomp;
		my @line = split( /,/ );
		foreach my $i ( @line ){
			push( @block_pattern, $i + 0 );
		}
	}
	close FIN;
	
	my $cnt = 0;
	foreach my $i ( @{$block->{blocks}} ){
		if( $block_pattern[ $cnt ] == 0 ){
			$i = new BlankBlock( $cnt % 13, int( $cnt / 13 ) );
		}
		elsif( $block_pattern[ $cnt ] == 1 ){
			$i = new NormalBlock( $cnt % 13, int( $cnt / 13 ) );
		}
		elsif( $block_pattern[ $cnt ] == 2 ){
			$i = new FragileBlock( $cnt % 13, int( $cnt / 13 ) );
		}
		elsif( $block_pattern[ $cnt ] == 3 ){
			$i = new UnbreakableBlock( $cnt % 13, int( $cnt / 13 ) );
		}
		elsif( $block_pattern[ $cnt ] >= 4 ){
			$i = new StrongBlock( $cnt % 13, int( $cnt / 13 ), $block_pattern[ $cnt ] - 3 );
		}
		else{
			$i = new BlankBlock( $cnt % 13, int( $cnt / 13 ) );
		}
		++$cnt;
	}
	
	
	# �p�b�P�[�W���ƃI�u�W�F�N�g�����֘A������
	bless $block, $this;
	
	return $block;
}

# �`��
sub draw
{
	my $this = shift;
	
	foreach my $i ( @{$this->{blocks}} ){
		$i->draw();
	}
}

# �X�V
sub update
{
	my $this = shift;
}

# �Փ˔���
sub collision
{
	my $this = shift;
	my $ball = shift;
	my $score = shift;
	
	foreach my $i ( @{$this->{blocks}} ){
		if( !$i->destroyed() ){
			my $side = $i->is_collided( $ball );
			if( $side ){
				$i->process_collision_with_ball();
				if( !$i->penetrate() ){
					$ball->process_collision_with_block( $side );
				}
				$$score += $i->get_score();
			}
		}
	}
}

1;
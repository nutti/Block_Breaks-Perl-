#!/usr/bin/perl

package Stage;

use strict;
use OpenGL ':all';

use base qw(Scene);
use NormalPlayer;
use NormalBall;


use NormalBlock;

# コンストラクタ
sub new
{
	# パッケージ名
	my $this = shift;
	
	# メンバ変数
	my $stage = {};
	$stage->{player} = new NormalPlayer;
	$stage->{ball} = new NormalBall;
	$stage->{block} = new NormalBlock( 3, 3 );
	
	# パッケージ名とオブジェクト名を関連させる
	bless $stage, $this;
	
	return $stage;
}

sub draw
{
	my $this = shift;
	
	$this->{player}->draw();
	$this->{ball}->draw();
	$this->{block}->draw();
}

sub update
{
	my $this = shift;
	my $input_manager = shift;
	
	$this->{player}->update( $input_manager );
	$this->{ball}->update();
	if( $this->{ball}->is_collided( $this->{player} ) ){
		$this->{ball}->process_collision_with_player();
	}
}

# 次のシーンに移行
sub set_next_scene
{
	
}

1;
#!/usr/bin/perl

use strict;

package InputManager;

# コンストラクタ
sub new
{
	# パッケージ名
	my $this = shift;
	
	# メンバ変数
	my $input_manager = {};
	my @keys = ();
	$#keys = 256;
	$input_manager->{keys} = \@keys;
	
	# パッケージ名とオブジェクト名を関連させる
	bless $input_manager, $this;
	
	return $input_manager;
}

# キーが入力されたことを通知
sub notify_key_input
{
	my $this = shift;
	my $code = shift;
	
	@{$this->{keys}}[ $code ] = 1;
}

# キーが押されているか？
sub is_pushed
{
	my $this = shift;
	my $code = shift;
	
	return @{$this->{keys}}[ $code ];
}

# キーの入力状態を初期化
sub clear
{
	my $this = shift;
	
	for( my $i = 0; $i < 256; ++$i ){
		@{$this->{keys}}[ $i ] = 0;
	}
}

# キーの状態を得る
sub get_key_state
{
	my $this = shift;
	
	return @{$this->{keys}};
}

1;
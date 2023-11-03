resource "aws_kinesis_stream" "kinesis_stream" {
  name        = var.name
  shard_count = var.shard_count

  dynamic "stream_mode_details" {
    for_each = var.on_demand ? [1] : []
    content {
      stream_mode = "ON_DEMAND"
    }
  }
}

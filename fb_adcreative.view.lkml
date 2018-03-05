include: "fb_stitch.view.lkml"

view: adcreative {
  extends: ["stitch"]

  sql_table_name: {{ _user_attributes["facebook_schema"] }}.adcreative ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension: call_to_action_type {
    type: string
    sql: ${TABLE}.call_to_action_type ;;
  }

  dimension: effective_instagram_story_id {
    type: string
    sql: ${TABLE}.effective_instagram_story_id ;;
  }

  dimension: effective_object_story_id {
    type: string
    sql: ${TABLE}.effective_object_story_id ;;
  }

  dimension: image_hash {
    type: string
    sql: ${TABLE}.image_hash ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: instagram_actor_id {
    type: string
    sql: ${TABLE}.instagram_actor_id ;;
  }

  dimension: instagram_permalink_url {
    type: string
    sql: ${TABLE}.instagram_permalink_url ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: object_story_id {
    type: string
    sql: ${TABLE}.object_story_id ;;
  }

  dimension: object_story_spec {
    hidden: yes
    sql: ${TABLE}.object_story_spec ;;
  }

  dimension: object_type {
    type: string
    sql: ${TABLE}.object_type ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: thumbnail_url {
    type: string
    sql: ${TABLE}.thumbnail_url ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}

view: adcreative__object_story_spec {
  dimension: instagram_actor_id {
    type: string
    sql: ${TABLE}.instagram_actor_id ;;
  }

  dimension: link_data {
    hidden: yes
    sql: ${TABLE}.link_data ;;
  }

  dimension: page_id {
    type: string
    sql: ${TABLE}.page_id ;;
  }

  dimension: video_data {
    hidden: yes
    sql: ${TABLE}.video_data ;;
  }
}

view: adcreative__object_story_spec__video_data__call_to_action {
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: value {
    hidden: yes
    sql: ${TABLE}.value ;;
  }
}

view: adcreative__object_story_spec__video_data__call_to_action__value {
  dimension: lead_gen_form_id {
    type: string
    sql: ${TABLE}.lead_gen_form_id ;;
  }

  dimension: link {
    type: string
    sql: ${TABLE}.link ;;
  }

  dimension: link_caption {
    type: string
    sql: ${TABLE}.link_caption ;;
  }

  dimension: link_format {
    type: string
    sql: ${TABLE}.link_format ;;
  }
}

view: adcreative__object_story_spec__video_data {
  dimension: call_to_action {
    hidden: yes
    sql: ${TABLE}.call_to_action ;;
  }

  dimension: image_hash {
    type: string
    sql: ${TABLE}.image_hash ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: link_description {
    type: string
    sql: ${TABLE}.link_description ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }
}

view: adcreative__object_story_spec__link_data__call_to_action {
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: adcreative__object_story_spec__link_data {
  dimension: attachment_style {
    type: string
    sql: ${TABLE}.attachment_style ;;
  }

  dimension: call_to_action {
    hidden: yes
    sql: ${TABLE}.call_to_action ;;
  }

  dimension: caption {
    type: string
    sql: ${TABLE}.caption ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: image_hash {
    type: string
    sql: ${TABLE}.image_hash ;;
  }

  dimension: link {
    type: string
    sql: ${TABLE}.link ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: picture {
    type: string
    sql: ${TABLE}.picture ;;
  }
}
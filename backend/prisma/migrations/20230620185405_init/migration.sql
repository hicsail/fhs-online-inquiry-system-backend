-- CreateTable
CREATE TABLE "action" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "type" TEXT NOT NULL,
    "model_id" INTEGER NOT NULL,
    "name" VARCHAR(254) NOT NULL,
    "description" TEXT,
    "parameters" TEXT,
    "parameter_mappings" TEXT,
    "visualization_settings" TEXT,
    "public_uuid" CHAR(36),
    "made_public_by_id" INTEGER,
    "creator_id" INTEGER,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "entity_id" CHAR(21),

    CONSTRAINT "action_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "activity" (
    "id" SERIAL NOT NULL,
    "topic" VARCHAR(32) NOT NULL,
    "timestamp" TIMESTAMPTZ(6) NOT NULL,
    "user_id" INTEGER,
    "model" VARCHAR(16),
    "model_id" INTEGER,
    "database_id" INTEGER,
    "table_id" INTEGER,
    "custom_id" VARCHAR(48),
    "details" TEXT NOT NULL,

    CONSTRAINT "activity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "application_permissions_revision" (
    "id" SERIAL NOT NULL,
    "before" TEXT NOT NULL,
    "after" TEXT NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "remark" TEXT,

    CONSTRAINT "general_permissions_revision_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bookmark_ordering" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "item_id" INTEGER NOT NULL,
    "ordering" INTEGER NOT NULL,

    CONSTRAINT "bookmark_ordering_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "brain_data" (
    "framid" SERIAL NOT NULL,
    "nppmih" interval,
    "nppmih_hours" INTEGER,
    "nppmih_minutes" INTEGER,
    "nprin" DECIMAL,
    "npfix" INTEGER,
    "npfrotispre" INTEGER,
    "npinf" INTEGER,
    "npavas" INTEGER,
    "npftdtau" INTEGER,
    "npftdtdp" INTEGER,
    "npftdt7" INTEGER,
    "nphipscl" INTEGER,
    "pathmnd" INTEGER,
    "pathad" INTEGER,
    "relatauo" INTEGER,

    CONSTRAINT "brain_data_pkey" PRIMARY KEY ("framid")
);

-- CreateTable
CREATE TABLE "brain_data_plus" (
    "framid" SERIAL NOT NULL,
    "sex" INTEGER,
    "age_core1" INTEGER,
    "race_code" VARCHAR,
    "edu_core0" INTEGER,
    "edu_core17_1" INTEGER,
    "edu_core17_2" INTEGER,
    "edu_core2372" INTEGER,
    "age_death" DECIMAL,
    "npwhiart" INTEGER,
    "npwhimac" INTEGER,
    "npwmr" INTEGER,
    "nphipscl" INTEGER,
    "npthal" INTEGER,
    "npbraak" INTEGER,
    "npneur" INTEGER,
    "npadnc" INTEGER,
    "npdiff" INTEGER,
    "npamy" INTEGER,
    "npold" INTEGER,
    "npold1" INTEGER,
    "npold2" INTEGER,
    "npold3" INTEGER,
    "npold4" INTEGER,
    "npoldd" INTEGER,
    "npoldd1" INTEGER,
    "npoldd2" INTEGER,
    "npoldd3" INTEGER,
    "npoldd4" INTEGER,
    "nparter" INTEGER,
    "nplbod" INTEGER,
    "nptdpa" INTEGER,
    "nptdpb" INTEGER,
    "nptdpc" INTEGER,
    "nptdpd" INTEGER,
    "nptdpe" INTEGER,
    "npftdtau" INTEGER,
    "nppick" INTEGER,
    "npftdt2" INTEGER,
    "npcort" INTEGER,
    "npprog" INTEGER,
    "npftdt5" INTEGER,
    "npftdt6" INTEGER,
    "npftdt7" INTEGER,
    "npftdt7a" INTEGER,
    "npftdt7b" INTEGER,
    "npftdt7c" INTEGER,
    "npftdt7d" INTEGER,
    "npftdt8" INTEGER,
    "npftdt9" INTEGER,
    "npftdt10" INTEGER,
    "npftdtdp" INTEGER,
    "npalsmnd" INTEGER,
    "npoftd" INTEGER,
    "npoftd1" INTEGER,
    "npoftd2" INTEGER,
    "npoftd3" INTEGER,
    "npoftd4" INTEGER,
    "npoftd5" INTEGER,
    "npnit" INTEGER,
    "demrv046" INTEGER,
    "demrv103" INTEGER,
    "hrx_ever" INTEGER,
    "dmrx_ever" INTEGER,
    "liprx_ever" INTEGER,
    "smoking_ever" INTEGER,

    CONSTRAINT "brain_data_plus_pkey" PRIMARY KEY ("framid")
);

-- CreateTable
CREATE TABLE "card_bookmark" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "card_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "card_bookmark_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "card_label" (
    "id" SERIAL NOT NULL,
    "card_id" INTEGER NOT NULL,
    "label_id" INTEGER NOT NULL,

    CONSTRAINT "card_label_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "collection" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "color" CHAR(7) NOT NULL,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "location" VARCHAR(254) NOT NULL DEFAULT '/',
    "personal_owner_id" INTEGER,
    "slug" VARCHAR(254) NOT NULL,
    "namespace" VARCHAR(254),
    "authority_level" VARCHAR(255),
    "entity_id" CHAR(21),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "collection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "collection_bookmark" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "collection_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "collection_bookmark_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "collection_permission_graph_revision" (
    "id" SERIAL NOT NULL,
    "before" TEXT NOT NULL,
    "after" TEXT NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "remark" TEXT,

    CONSTRAINT "collection_revision_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "computation_job" (
    "id" SERIAL NOT NULL,
    "creator_id" INTEGER,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "type" VARCHAR(254) NOT NULL,
    "status" VARCHAR(254) NOT NULL,
    "context" TEXT,
    "ended_at" TIMESTAMP(6),

    CONSTRAINT "computation_job_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "computation_job_result" (
    "id" SERIAL NOT NULL,
    "job_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "permanence" VARCHAR(254) NOT NULL,
    "payload" TEXT NOT NULL,

    CONSTRAINT "computation_job_result_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "core_sequence" (
    "framid" INTEGER NOT NULL,
    "core_num" INTEGER NOT NULL,
    "total_tests" INTEGER,
    "age" INTEGER,
    "date" DATE,
    "height" DECIMAL,
    "weight" INTEGER,
    "bmi" DECIMAL,
    "sbp" DECIMAL,
    "dbp" DECIMAL,
    "vent_rt" INTEGER,
    "smoking" INTEGER,
    "cpd" INTEGER,
    "bg" INTEGER,
    "tc" INTEGER,
    "triglycerides" INTEGER,
    "calc_ldl" INTEGER,
    "hdl" INTEGER,
    "hrx" INTEGER,
    "liprx" INTEGER,
    "dmrx" INTEGER,
    "hip" DECIMAL,
    "waist" DECIMAL,
    "creatinine" DECIMAL,
    "fasting_bg" INTEGER,
    "albumin" DECIMAL,
    "ast" INTEGER,
    "alt_indicator" INTEGER,
    "hemoglobin" DECIMAL,
    "wbc" DECIMAL,
    "aspirin_cc" INTEGER,
    "nsaids_cc" INTEGER,
    "depressrx" INTEGER,
    "crp" DECIMAL,
    "fibrinoger" INTEGER,
    "hba1c" DECIMAL,
    "icam1" DECIMAL,
    "mcp1" DECIMAL,
    "interleukin6" DECIMAL,
    "interleukin18" DECIMAL,
    "amyloid40" DECIMAL,
    "amyloid40_indicator" INTEGER,
    "amyloid42" DECIMAL,
    "myeloperozidase" DECIMAL,
    "cd40" DECIMAL,
    "cogscr" INTEGER,

    CONSTRAINT "core_sequence_pkey" PRIMARY KEY ("framid","core_num")
);

-- CreateTable
CREATE TABLE "core_session" (
    "id" VARCHAR(254) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "anti_csrf_token" TEXT,

    CONSTRAINT "core_session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "core_tests" (
    "framid" INTEGER NOT NULL,
    "core_num" INTEGER NOT NULL,
    "total_tests" INTEGER,
    "type" VARCHAR NOT NULL,
    "age" INTEGER,
    "date" DATE,
    "height" DECIMAL,
    "weight" INTEGER,
    "bmi" DECIMAL,
    "sbp" DECIMAL,
    "dbp" DECIMAL,
    "vent_rt" INTEGER,
    "smoking" INTEGER,
    "cpd" INTEGER,
    "bg" INTEGER,
    "tc" INTEGER,
    "triglycerides" INTEGER,
    "calc_ldl" INTEGER,
    "hdl" INTEGER,
    "hrx" INTEGER,
    "liprx" INTEGER,
    "dmrx" INTEGER,
    "hip" DECIMAL,
    "waist" DECIMAL,
    "creatinine" DECIMAL,
    "fasting_bg" INTEGER,
    "albumin" DECIMAL,
    "ast" INTEGER,
    "alt_indicator" INTEGER,
    "hemoglobin" DECIMAL,
    "wbc" DECIMAL,
    "aspirin_cc" INTEGER,
    "nsaids_cc" INTEGER,
    "depressrx" INTEGER,
    "crp" DECIMAL,
    "fibrinoger" INTEGER,
    "hba1c" DECIMAL,
    "icam1" DECIMAL,
    "mcp1" DECIMAL,
    "interleukin6" DECIMAL,
    "interleukin18" DECIMAL,
    "amyloid40" DECIMAL,
    "amyloid40_indicator" INTEGER,
    "amyloid42" DECIMAL,
    "myeloperozidase" DECIMAL,
    "cd40" DECIMAL,
    "cogscr" INTEGER,

    CONSTRAINT "core_tests_pkey" PRIMARY KEY ("framid","core_num","type")
);

-- CreateTable
CREATE TABLE "core_user" (
    "id" SERIAL NOT NULL,
    "email" CITEXT NOT NULL,
    "first_name" VARCHAR(254),
    "last_name" VARCHAR(254),
    "password" VARCHAR(254),
    "password_salt" VARCHAR(254) DEFAULT 'default',
    "date_joined" TIMESTAMPTZ(6) NOT NULL,
    "last_login" TIMESTAMPTZ(6),
    "is_superuser" BOOLEAN NOT NULL DEFAULT false,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "reset_token" VARCHAR(254),
    "reset_triggered" BIGINT,
    "is_qbnewb" BOOLEAN NOT NULL DEFAULT true,
    "google_auth" BOOLEAN NOT NULL DEFAULT false,
    "ldap_auth" BOOLEAN NOT NULL DEFAULT false,
    "login_attributes" TEXT,
    "updated_at" TIMESTAMP(6),
    "sso_source" VARCHAR(254),
    "locale" VARCHAR(5),
    "is_datasetnewb" BOOLEAN NOT NULL DEFAULT true,
    "settings" TEXT,

    CONSTRAINT "core_user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dashboard_bookmark" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "dashboard_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "dashboard_bookmark_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dashboard_favorite" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "dashboard_id" INTEGER NOT NULL,

    CONSTRAINT "dashboard_favorite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dashboardcard_series" (
    "id" SERIAL NOT NULL,
    "dashboardcard_id" INTEGER NOT NULL,
    "card_id" INTEGER NOT NULL,
    "position" INTEGER NOT NULL,

    CONSTRAINT "dashboardcard_series_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "data_migrations" (
    "id" VARCHAR(254) NOT NULL,
    "timestamp" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "data_migrations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "databasechangelog" (
    "id" VARCHAR(255) NOT NULL,
    "author" VARCHAR(255) NOT NULL,
    "filename" VARCHAR(255) NOT NULL,
    "dateexecuted" TIMESTAMP(6) NOT NULL,
    "orderexecuted" INTEGER NOT NULL,
    "exectype" VARCHAR(10) NOT NULL,
    "md5sum" VARCHAR(35),
    "description" VARCHAR(255),
    "comments" VARCHAR(255),
    "tag" VARCHAR(255),
    "liquibase" VARCHAR(20),
    "contexts" VARCHAR(255),
    "labels" VARCHAR(255),
    "deployment_id" VARCHAR(10)
);

-- CreateTable
CREATE TABLE "databasechangeloglock" (
    "id" INTEGER NOT NULL,
    "locked" BOOLEAN NOT NULL,
    "lockgranted" TIMESTAMP(6),
    "lockedby" VARCHAR(255),

    CONSTRAINT "databasechangeloglock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dcdt_dates" (
    "framid" INTEGER NOT NULL,
    "dcdt_date" DATE NOT NULL,
    "num_dcdt" INTEGER,
    "sex" INTEGER,

    CONSTRAINT "dcdt_dates_pkey" PRIMARY KEY ("framid","dcdt_date")
);

-- CreateTable
CREATE TABLE "dependency" (
    "id" SERIAL NOT NULL,
    "model" VARCHAR(32) NOT NULL,
    "model_id" INTEGER NOT NULL,
    "dependent_on_model" VARCHAR(32) NOT NULL,
    "dependent_on_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "dependency_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "derived_dcdt_dates" (
    "framid" INTEGER NOT NULL,
    "derived_dcdt_date" DATE NOT NULL,
    "num_derived_dcdt" INTEGER,
    "sex" INTEGER,

    CONSTRAINT "derived_dcdt_dates_pkey" PRIMARY KEY ("framid","derived_dcdt_date")
);

-- CreateTable
CREATE TABLE "dimension" (
    "id" SERIAL NOT NULL,
    "field_id" INTEGER NOT NULL,
    "name" VARCHAR(254) NOT NULL,
    "type" VARCHAR(254) NOT NULL,
    "human_readable_field_id" INTEGER,
    "created_at" TIMESTAMP(6) NOT NULL,
    "updated_at" TIMESTAMP(6) NOT NULL,
    "entity_id" CHAR(21),

    CONSTRAINT "dimension_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dvoice_dates" (
    "framid" INTEGER NOT NULL,
    "dvoice_date" DATE NOT NULL,
    "num_dvoice" INTEGER,
    "sex" INTEGER,

    CONSTRAINT "dvoice_dates_pkey" PRIMARY KEY ("framid","dvoice_date")
);

-- CreateTable
CREATE TABLE "http_action" (
    "action_id" INTEGER NOT NULL,
    "template" TEXT NOT NULL,
    "response_handle" TEXT,
    "error_handle" TEXT,

    CONSTRAINT "pk_http_action" PRIMARY KEY ("action_id")
);

-- CreateTable
CREATE TABLE "implicit_action" (
    "action_id" INTEGER NOT NULL,
    "kind" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "label" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(254) NOT NULL,
    "slug" VARCHAR(254) NOT NULL,
    "icon" VARCHAR(128),

    CONSTRAINT "label_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "login_history" (
    "id" SERIAL NOT NULL,
    "timestamp" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_id" INTEGER NOT NULL,
    "session_id" VARCHAR(254),
    "device_id" CHAR(36) NOT NULL,
    "device_description" TEXT NOT NULL,
    "ip_address" TEXT NOT NULL,

    CONSTRAINT "login_history_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "metabase_database" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" VARCHAR(254) NOT NULL,
    "description" TEXT,
    "details" TEXT NOT NULL,
    "engine" VARCHAR(254) NOT NULL,
    "is_sample" BOOLEAN NOT NULL DEFAULT false,
    "is_full_sync" BOOLEAN NOT NULL DEFAULT true,
    "points_of_interest" TEXT,
    "caveats" TEXT,
    "metadata_sync_schedule" VARCHAR(254) NOT NULL DEFAULT '0 50 * * * ? *',
    "cache_field_values_schedule" VARCHAR(254) NOT NULL DEFAULT '0 50 0 * * ? *',
    "timezone" VARCHAR(254),
    "is_on_demand" BOOLEAN NOT NULL DEFAULT false,
    "options" TEXT,
    "auto_run_queries" BOOLEAN NOT NULL DEFAULT true,
    "refingerprint" BOOLEAN,
    "cache_ttl" INTEGER,
    "initial_sync_status" VARCHAR(32) NOT NULL DEFAULT 'complete',
    "creator_id" INTEGER,
    "settings" TEXT,
    "dbms_version" TEXT,

    CONSTRAINT "metabase_database_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "metabase_field" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "name" VARCHAR(254) NOT NULL,
    "base_type" VARCHAR(255) NOT NULL,
    "semantic_type" VARCHAR(255),
    "active" BOOLEAN NOT NULL DEFAULT true,
    "description" TEXT,
    "preview_display" BOOLEAN NOT NULL DEFAULT true,
    "position" INTEGER NOT NULL DEFAULT 0,
    "table_id" INTEGER NOT NULL,
    "parent_id" INTEGER,
    "display_name" VARCHAR(254),
    "visibility_type" VARCHAR(32) NOT NULL DEFAULT 'normal',
    "fk_target_field_id" INTEGER,
    "last_analyzed" TIMESTAMPTZ(6),
    "points_of_interest" TEXT,
    "caveats" TEXT,
    "fingerprint" TEXT,
    "fingerprint_version" INTEGER NOT NULL DEFAULT 0,
    "database_type" TEXT NOT NULL,
    "has_field_values" TEXT,
    "settings" TEXT,
    "database_position" INTEGER NOT NULL DEFAULT 0,
    "custom_position" INTEGER NOT NULL DEFAULT 0,
    "effective_type" VARCHAR(255),
    "coercion_strategy" VARCHAR(255),
    "nfc_path" VARCHAR(254),
    "database_required" BOOLEAN NOT NULL DEFAULT false,
    "database_is_auto_increment" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "metabase_field_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "metabase_fieldvalues" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "values" TEXT,
    "human_readable_values" TEXT,
    "field_id" INTEGER NOT NULL,
    "has_more_values" BOOLEAN DEFAULT false,
    "type" VARCHAR(32) NOT NULL DEFAULT 'full',
    "hash_key" TEXT,
    "last_used_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "metabase_fieldvalues_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "metabase_table" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "name" VARCHAR(254) NOT NULL,
    "description" TEXT,
    "entity_type" VARCHAR(254),
    "active" BOOLEAN NOT NULL,
    "db_id" INTEGER NOT NULL,
    "display_name" VARCHAR(254),
    "visibility_type" VARCHAR(254),
    "schema" VARCHAR(254),
    "points_of_interest" TEXT,
    "caveats" TEXT,
    "show_in_getting_started" BOOLEAN NOT NULL DEFAULT false,
    "field_order" VARCHAR(254) NOT NULL DEFAULT 'database',
    "initial_sync_status" VARCHAR(32) NOT NULL DEFAULT 'complete',

    CONSTRAINT "metabase_table_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "metric" (
    "id" SERIAL NOT NULL,
    "table_id" INTEGER NOT NULL,
    "creator_id" INTEGER NOT NULL,
    "name" VARCHAR(254) NOT NULL,
    "description" TEXT,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "definition" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "points_of_interest" TEXT,
    "caveats" TEXT,
    "how_is_this_calculated" TEXT,
    "show_in_getting_started" BOOLEAN NOT NULL DEFAULT false,
    "entity_id" CHAR(21),

    CONSTRAINT "metric_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "metric_important_field" (
    "id" SERIAL NOT NULL,
    "metric_id" INTEGER NOT NULL,
    "field_id" INTEGER NOT NULL,

    CONSTRAINT "metric_important_field_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moderation_review" (
    "id" SERIAL NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" VARCHAR(255),
    "text" TEXT,
    "moderated_item_id" INTEGER NOT NULL,
    "moderated_item_type" VARCHAR(255) NOT NULL,
    "moderator_id" INTEGER NOT NULL,
    "most_recent" BOOLEAN NOT NULL,

    CONSTRAINT "moderation_review_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "mri_dates" (
    "framid" INTEGER NOT NULL,
    "mri_date" DATE NOT NULL,
    "num_mri" INTEGER,
    "sex" INTEGER,

    CONSTRAINT "mri_dates_pkey" PRIMARY KEY ("framid","mri_date")
);

-- CreateTable
CREATE TABLE "native_query_snippet" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(254) NOT NULL,
    "description" TEXT,
    "content" TEXT NOT NULL,
    "creator_id" INTEGER NOT NULL,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "collection_id" INTEGER,
    "entity_id" CHAR(21),

    CONSTRAINT "native_query_snippet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "parameter_card" (
    "id" SERIAL NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "card_id" INTEGER NOT NULL,
    "parameterized_object_type" VARCHAR(32) NOT NULL,
    "parameterized_object_id" INTEGER NOT NULL,
    "parameter_id" VARCHAR(36) NOT NULL,
    "entity_id" CHAR(21),

    CONSTRAINT "parameter_card_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "participants" (
    "framid" SERIAL NOT NULL,
    "cohort" INTEGER,
    "id" INTEGER,
    "gender" INTEGER,
    "race" VARCHAR,
    "edu_core2" INTEGER,
    "edu_core8" INTEGER,

    CONSTRAINT "participants_pkey" PRIMARY KEY ("framid")
);

-- CreateTable
CREATE TABLE "permissions" (
    "id" SERIAL NOT NULL,
    "object" VARCHAR(254) NOT NULL,
    "group_id" INTEGER NOT NULL,

    CONSTRAINT "permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permissions_group" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,

    CONSTRAINT "permissions_group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permissions_group_membership" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "is_group_manager" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "permissions_group_membership_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permissions_revision" (
    "id" SERIAL NOT NULL,
    "before" TEXT NOT NULL,
    "after" TEXT NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL,
    "remark" TEXT,

    CONSTRAINT "permissions_revision_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "persisted_info" (
    "id" SERIAL NOT NULL,
    "database_id" INTEGER NOT NULL,
    "card_id" INTEGER NOT NULL,
    "question_slug" TEXT NOT NULL,
    "table_name" TEXT NOT NULL,
    "definition" TEXT,
    "query_hash" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT false,
    "state" TEXT NOT NULL,
    "refresh_begin" TIMESTAMPTZ(6) NOT NULL,
    "refresh_end" TIMESTAMPTZ(6),
    "state_change_at" TIMESTAMPTZ(6),
    "error" TEXT,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "creator_id" INTEGER,

    CONSTRAINT "persisted_info_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pulse" (
    "id" SERIAL NOT NULL,
    "creator_id" INTEGER NOT NULL,
    "name" VARCHAR(254),
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "skip_if_empty" BOOLEAN NOT NULL DEFAULT false,
    "alert_condition" VARCHAR(254),
    "alert_first_only" BOOLEAN,
    "alert_above_goal" BOOLEAN,
    "collection_id" INTEGER,
    "collection_position" SMALLINT,
    "archived" BOOLEAN DEFAULT false,
    "dashboard_id" INTEGER,
    "parameters" TEXT NOT NULL,
    "entity_id" CHAR(21),

    CONSTRAINT "pulse_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pulse_card" (
    "id" SERIAL NOT NULL,
    "pulse_id" INTEGER NOT NULL,
    "card_id" INTEGER NOT NULL,
    "position" INTEGER NOT NULL,
    "include_csv" BOOLEAN NOT NULL DEFAULT false,
    "include_xls" BOOLEAN NOT NULL DEFAULT false,
    "dashboard_card_id" INTEGER,
    "entity_id" CHAR(21),

    CONSTRAINT "pulse_card_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pulse_channel" (
    "id" SERIAL NOT NULL,
    "pulse_id" INTEGER NOT NULL,
    "channel_type" VARCHAR(32) NOT NULL,
    "details" TEXT NOT NULL,
    "schedule_type" VARCHAR(32) NOT NULL,
    "schedule_hour" INTEGER,
    "schedule_day" VARCHAR(64),
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "schedule_frame" VARCHAR(32),
    "enabled" BOOLEAN NOT NULL DEFAULT true,
    "entity_id" CHAR(21),

    CONSTRAINT "pulse_channel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pulse_channel_recipient" (
    "id" SERIAL NOT NULL,
    "pulse_channel_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,

    CONSTRAINT "pulse_channel_recipient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "qrtz_blob_triggers" (
    "sched_name" VARCHAR(120) NOT NULL,
    "trigger_name" VARCHAR(200) NOT NULL,
    "trigger_group" VARCHAR(200) NOT NULL,
    "blob_data" BYTEA,

    CONSTRAINT "pk_qrtz_blob_triggers" PRIMARY KEY ("sched_name","trigger_name","trigger_group")
);

-- CreateTable
CREATE TABLE "qrtz_calendars" (
    "sched_name" VARCHAR(120) NOT NULL,
    "calendar_name" VARCHAR(200) NOT NULL,
    "calendar" BYTEA NOT NULL,

    CONSTRAINT "pk_qrtz_calendars" PRIMARY KEY ("sched_name","calendar_name")
);

-- CreateTable
CREATE TABLE "qrtz_cron_triggers" (
    "sched_name" VARCHAR(120) NOT NULL,
    "trigger_name" VARCHAR(200) NOT NULL,
    "trigger_group" VARCHAR(200) NOT NULL,
    "cron_expression" VARCHAR(120) NOT NULL,
    "time_zone_id" VARCHAR(80),

    CONSTRAINT "pk_qrtz_cron_triggers" PRIMARY KEY ("sched_name","trigger_name","trigger_group")
);

-- CreateTable
CREATE TABLE "qrtz_fired_triggers" (
    "sched_name" VARCHAR(120) NOT NULL,
    "entry_id" VARCHAR(95) NOT NULL,
    "trigger_name" VARCHAR(200) NOT NULL,
    "trigger_group" VARCHAR(200) NOT NULL,
    "instance_name" VARCHAR(200) NOT NULL,
    "fired_time" BIGINT NOT NULL,
    "sched_time" BIGINT,
    "priority" INTEGER NOT NULL,
    "state" VARCHAR(16) NOT NULL,
    "job_name" VARCHAR(200),
    "job_group" VARCHAR(200),
    "is_nonconcurrent" BOOLEAN,
    "requests_recovery" BOOLEAN,

    CONSTRAINT "pk_qrtz_fired_triggers" PRIMARY KEY ("sched_name","entry_id")
);

-- CreateTable
CREATE TABLE "qrtz_job_details" (
    "sched_name" VARCHAR(120) NOT NULL,
    "job_name" VARCHAR(200) NOT NULL,
    "job_group" VARCHAR(200) NOT NULL,
    "description" VARCHAR(250),
    "job_class_name" VARCHAR(250) NOT NULL,
    "is_durable" BOOLEAN NOT NULL,
    "is_nonconcurrent" BOOLEAN NOT NULL,
    "is_update_data" BOOLEAN NOT NULL,
    "requests_recovery" BOOLEAN NOT NULL,
    "job_data" BYTEA,

    CONSTRAINT "pk_qrtz_job_details" PRIMARY KEY ("sched_name","job_name","job_group")
);

-- CreateTable
CREATE TABLE "qrtz_locks" (
    "sched_name" VARCHAR(120) NOT NULL,
    "lock_name" VARCHAR(40) NOT NULL,

    CONSTRAINT "pk_qrtz_locks" PRIMARY KEY ("sched_name","lock_name")
);

-- CreateTable
CREATE TABLE "qrtz_paused_trigger_grps" (
    "sched_name" VARCHAR(120) NOT NULL,
    "trigger_group" VARCHAR(200) NOT NULL,

    CONSTRAINT "pk_sched_name" PRIMARY KEY ("sched_name","trigger_group")
);

-- CreateTable
CREATE TABLE "qrtz_scheduler_state" (
    "sched_name" VARCHAR(120) NOT NULL,
    "instance_name" VARCHAR(200) NOT NULL,
    "last_checkin_time" BIGINT NOT NULL,
    "checkin_interval" BIGINT NOT NULL,

    CONSTRAINT "pk_qrtz_scheduler_state" PRIMARY KEY ("sched_name","instance_name")
);

-- CreateTable
CREATE TABLE "qrtz_simple_triggers" (
    "sched_name" VARCHAR(120) NOT NULL,
    "trigger_name" VARCHAR(200) NOT NULL,
    "trigger_group" VARCHAR(200) NOT NULL,
    "repeat_count" BIGINT NOT NULL,
    "repeat_interval" BIGINT NOT NULL,
    "times_triggered" BIGINT NOT NULL,

    CONSTRAINT "pk_qrtz_simple_triggers" PRIMARY KEY ("sched_name","trigger_name","trigger_group")
);

-- CreateTable
CREATE TABLE "qrtz_simprop_triggers" (
    "sched_name" VARCHAR(120) NOT NULL,
    "trigger_name" VARCHAR(200) NOT NULL,
    "trigger_group" VARCHAR(200) NOT NULL,
    "str_prop_1" VARCHAR(512),
    "str_prop_2" VARCHAR(512),
    "str_prop_3" VARCHAR(512),
    "int_prop_1" INTEGER,
    "int_prop_2" INTEGER,
    "long_prop_1" BIGINT,
    "long_prop_2" BIGINT,
    "dec_prop_1" DECIMAL(13,4),
    "dec_prop_2" DECIMAL(13,4),
    "bool_prop_1" BOOLEAN,
    "bool_prop_2" BOOLEAN,

    CONSTRAINT "pk_qrtz_simprop_triggers" PRIMARY KEY ("sched_name","trigger_name","trigger_group")
);

-- CreateTable
CREATE TABLE "qrtz_triggers" (
    "sched_name" VARCHAR(120) NOT NULL,
    "trigger_name" VARCHAR(200) NOT NULL,
    "trigger_group" VARCHAR(200) NOT NULL,
    "job_name" VARCHAR(200) NOT NULL,
    "job_group" VARCHAR(200) NOT NULL,
    "description" VARCHAR(250),
    "next_fire_time" BIGINT,
    "prev_fire_time" BIGINT,
    "priority" INTEGER,
    "trigger_state" VARCHAR(16) NOT NULL,
    "trigger_type" VARCHAR(8) NOT NULL,
    "start_time" BIGINT NOT NULL,
    "end_time" BIGINT,
    "calendar_name" VARCHAR(200),
    "misfire_instr" SMALLINT,
    "job_data" BYTEA,

    CONSTRAINT "pk_qrtz_triggers" PRIMARY KEY ("sched_name","trigger_name","trigger_group")
);

-- CreateTable
CREATE TABLE "query" (
    "query_hash" BYTEA NOT NULL,
    "average_execution_time" INTEGER NOT NULL,
    "query" TEXT,

    CONSTRAINT "query_pkey" PRIMARY KEY ("query_hash")
);

-- CreateTable
CREATE TABLE "query_action" (
    "action_id" INTEGER NOT NULL,
    "database_id" INTEGER NOT NULL,
    "dataset_query" TEXT NOT NULL,

    CONSTRAINT "pk_query_action" PRIMARY KEY ("action_id")
);

-- CreateTable
CREATE TABLE "query_cache" (
    "query_hash" BYTEA NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "results" BYTEA NOT NULL,

    CONSTRAINT "query_cache_pkey" PRIMARY KEY ("query_hash")
);

-- CreateTable
CREATE TABLE "query_execution" (
    "id" SERIAL NOT NULL,
    "hash" BYTEA NOT NULL,
    "started_at" TIMESTAMPTZ(6) NOT NULL,
    "running_time" INTEGER NOT NULL,
    "result_rows" INTEGER NOT NULL,
    "native" BOOLEAN NOT NULL,
    "context" VARCHAR(32),
    "error" TEXT,
    "executor_id" INTEGER,
    "card_id" INTEGER,
    "dashboard_id" INTEGER,
    "pulse_id" INTEGER,
    "database_id" INTEGER,
    "cache_hit" BOOLEAN,

    CONSTRAINT "query_execution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "report_card" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "name" VARCHAR(254) NOT NULL,
    "description" TEXT,
    "display" VARCHAR(254) NOT NULL,
    "dataset_query" TEXT NOT NULL,
    "visualization_settings" TEXT NOT NULL,
    "creator_id" INTEGER NOT NULL,
    "database_id" INTEGER NOT NULL,
    "table_id" INTEGER,
    "query_type" VARCHAR(16),
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "collection_id" INTEGER,
    "public_uuid" CHAR(36),
    "made_public_by_id" INTEGER,
    "enable_embedding" BOOLEAN NOT NULL DEFAULT false,
    "embedding_params" TEXT,
    "cache_ttl" INTEGER,
    "result_metadata" TEXT,
    "collection_position" SMALLINT,
    "dataset" BOOLEAN NOT NULL DEFAULT false,
    "entity_id" CHAR(21),
    "parameters" TEXT,
    "parameter_mappings" TEXT,
    "collection_preview" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "report_card_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "report_cardfavorite" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "card_id" INTEGER NOT NULL,
    "owner_id" INTEGER NOT NULL,

    CONSTRAINT "report_cardfavorite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "report_dashboard" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "name" VARCHAR(254) NOT NULL,
    "description" TEXT,
    "creator_id" INTEGER NOT NULL,
    "parameters" TEXT NOT NULL,
    "points_of_interest" TEXT,
    "caveats" TEXT,
    "show_in_getting_started" BOOLEAN NOT NULL DEFAULT false,
    "public_uuid" CHAR(36),
    "made_public_by_id" INTEGER,
    "enable_embedding" BOOLEAN NOT NULL DEFAULT false,
    "embedding_params" TEXT,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "position" INTEGER,
    "collection_id" INTEGER,
    "collection_position" SMALLINT,
    "cache_ttl" INTEGER,
    "entity_id" CHAR(21),

    CONSTRAINT "report_dashboard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "report_dashboardcard" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "size_x" INTEGER NOT NULL,
    "size_y" INTEGER NOT NULL,
    "row" INTEGER NOT NULL,
    "col" INTEGER NOT NULL,
    "card_id" INTEGER,
    "dashboard_id" INTEGER NOT NULL,
    "parameter_mappings" TEXT NOT NULL,
    "visualization_settings" TEXT NOT NULL,
    "entity_id" CHAR(21),
    "action_id" INTEGER,

    CONSTRAINT "report_dashboardcard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "revision" (
    "id" SERIAL NOT NULL,
    "model" VARCHAR(16) NOT NULL,
    "model_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "timestamp" TIMESTAMPTZ(6) NOT NULL,
    "object" TEXT NOT NULL,
    "is_reversion" BOOLEAN NOT NULL DEFAULT false,
    "is_creation" BOOLEAN NOT NULL DEFAULT false,
    "message" TEXT,

    CONSTRAINT "revision_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sandboxes" (
    "id" SERIAL NOT NULL,
    "group_id" INTEGER NOT NULL,
    "table_id" INTEGER NOT NULL,
    "card_id" INTEGER,
    "attribute_remappings" TEXT,
    "permission_id" INTEGER,

    CONSTRAINT "group_table_access_policy_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secret" (
    "id" SERIAL NOT NULL,
    "version" INTEGER NOT NULL DEFAULT 1,
    "creator_id" INTEGER,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6),
    "name" VARCHAR(254) NOT NULL,
    "kind" VARCHAR(254) NOT NULL,
    "source" VARCHAR(254),
    "value" BYTEA NOT NULL,

    CONSTRAINT "secret_pkey" PRIMARY KEY ("id","version")
);

-- CreateTable
CREATE TABLE "segment" (
    "id" SERIAL NOT NULL,
    "table_id" INTEGER NOT NULL,
    "creator_id" INTEGER NOT NULL,
    "name" VARCHAR(254) NOT NULL,
    "description" TEXT,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "definition" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,
    "points_of_interest" TEXT,
    "caveats" TEXT,
    "show_in_getting_started" BOOLEAN NOT NULL DEFAULT false,
    "entity_id" CHAR(21),

    CONSTRAINT "segment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "setting" (
    "key" VARCHAR(254) NOT NULL,
    "value" TEXT NOT NULL,

    CONSTRAINT "setting_pkey" PRIMARY KEY ("key")
);

-- CreateTable
CREATE TABLE "survival" (
    "idtype" INTEGER NOT NULL,
    "framid" INTEGER NOT NULL,
    "date_of_death" DATE,
    "age_at_death" INTEGER,

    CONSTRAINT "survival_pkey" PRIMARY KEY ("idtype","framid")
);

-- CreateTable
CREATE TABLE "task_history" (
    "id" SERIAL NOT NULL,
    "task" VARCHAR(254) NOT NULL,
    "db_id" INTEGER,
    "started_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ended_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "duration" INTEGER NOT NULL,
    "task_details" TEXT,

    CONSTRAINT "task_history_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "timeline" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),
    "icon" VARCHAR(128) NOT NULL,
    "collection_id" INTEGER,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "creator_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "default" BOOLEAN NOT NULL DEFAULT false,
    "entity_id" CHAR(21),

    CONSTRAINT "timeline_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "timeline_event" (
    "id" SERIAL NOT NULL,
    "timeline_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),
    "timestamp" TIMESTAMPTZ(6) NOT NULL,
    "time_matters" BOOLEAN NOT NULL,
    "timezone" VARCHAR(255) NOT NULL,
    "icon" VARCHAR(128) NOT NULL,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "creator_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "timeline_event_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "view_log" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER,
    "model" VARCHAR(16) NOT NULL,
    "model_id" INTEGER NOT NULL,
    "timestamp" TIMESTAMPTZ(6) NOT NULL,
    "metadata" TEXT,

    CONSTRAINT "view_log_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "action_public_uuid_key" ON "action"("public_uuid");

-- CreateIndex
CREATE UNIQUE INDEX "action_entity_id_key" ON "action"("entity_id");

-- CreateIndex
CREATE INDEX "idx_action_creator_id" ON "action"("creator_id");

-- CreateIndex
CREATE INDEX "idx_action_public_uuid" ON "action"("public_uuid");

-- CreateIndex
CREATE INDEX "idx_activity_custom_id" ON "activity"("custom_id");

-- CreateIndex
CREATE INDEX "idx_activity_timestamp" ON "activity"("timestamp");

-- CreateIndex
CREATE INDEX "idx_activity_user_id" ON "activity"("user_id");

-- CreateIndex
CREATE INDEX "idx_bookmark_ordering_user_id" ON "bookmark_ordering"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_bookmark_user_id_ordering" ON "bookmark_ordering"("user_id", "ordering");

-- CreateIndex
CREATE UNIQUE INDEX "unique_bookmark_user_id_type_item_id" ON "bookmark_ordering"("user_id", "type", "item_id");

-- CreateIndex
CREATE INDEX "idx_card_bookmark_card_id" ON "card_bookmark"("card_id");

-- CreateIndex
CREATE INDEX "idx_card_bookmark_user_id" ON "card_bookmark"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_card_bookmark_user_id_card_id" ON "card_bookmark"("user_id", "card_id");

-- CreateIndex
CREATE INDEX "idx_card_label_card_id" ON "card_label"("card_id");

-- CreateIndex
CREATE INDEX "idx_card_label_label_id" ON "card_label"("label_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_card_label_card_id_label_id" ON "card_label"("card_id", "label_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_collection_personal_owner_id" ON "collection"("personal_owner_id");

-- CreateIndex
CREATE UNIQUE INDEX "collection_entity_id_key" ON "collection"("entity_id");

-- CreateIndex
CREATE INDEX "idx_collection_location" ON "collection"("location");

-- CreateIndex
CREATE INDEX "idx_collection_personal_owner_id" ON "collection"("personal_owner_id");

-- CreateIndex
CREATE INDEX "idx_collection_bookmark_collection_id" ON "collection_bookmark"("collection_id");

-- CreateIndex
CREATE INDEX "idx_collection_bookmark_user_id" ON "collection_bookmark"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_collection_bookmark_user_id_collection_id" ON "collection_bookmark"("user_id", "collection_id");

-- CreateIndex
CREATE UNIQUE INDEX "core_user_email_key" ON "core_user"("email");

-- CreateIndex
CREATE INDEX "idx_dashboard_bookmark_dashboard_id" ON "dashboard_bookmark"("dashboard_id");

-- CreateIndex
CREATE INDEX "idx_dashboard_bookmark_user_id" ON "dashboard_bookmark"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_dashboard_bookmark_user_id_dashboard_id" ON "dashboard_bookmark"("user_id", "dashboard_id");

-- CreateIndex
CREATE INDEX "idx_dashboard_favorite_dashboard_id" ON "dashboard_favorite"("dashboard_id");

-- CreateIndex
CREATE INDEX "idx_dashboard_favorite_user_id" ON "dashboard_favorite"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_dashboard_favorite_user_id_dashboard_id" ON "dashboard_favorite"("user_id", "dashboard_id");

-- CreateIndex
CREATE INDEX "idx_dashboardcard_series_card_id" ON "dashboardcard_series"("card_id");

-- CreateIndex
CREATE INDEX "idx_dashboardcard_series_dashboardcard_id" ON "dashboardcard_series"("dashboardcard_id");

-- CreateIndex
CREATE INDEX "idx_data_migrations_id" ON "data_migrations"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_databasechangelog_id_author_filename" ON "databasechangelog"("id", "author", "filename");

-- CreateIndex
CREATE INDEX "idx_dependency_dependent_on_id" ON "dependency"("dependent_on_id");

-- CreateIndex
CREATE INDEX "idx_dependency_dependent_on_model" ON "dependency"("dependent_on_model");

-- CreateIndex
CREATE INDEX "idx_dependency_model" ON "dependency"("model");

-- CreateIndex
CREATE INDEX "idx_dependency_model_id" ON "dependency"("model_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_dimension_field_id" ON "dimension"("field_id");

-- CreateIndex
CREATE UNIQUE INDEX "dimension_entity_id_key" ON "dimension"("entity_id");

-- CreateIndex
CREATE INDEX "idx_dimension_field_id" ON "dimension"("field_id");

-- CreateIndex
CREATE UNIQUE INDEX "label_slug_key" ON "label"("slug");

-- CreateIndex
CREATE INDEX "idx_label_slug" ON "label"("slug");

-- CreateIndex
CREATE INDEX "idx_session_id" ON "login_history"("session_id");

-- CreateIndex
CREATE INDEX "idx_timestamp" ON "login_history"("timestamp");

-- CreateIndex
CREATE INDEX "idx_user_id" ON "login_history"("user_id");

-- CreateIndex
CREATE INDEX "idx_user_id_device_id" ON "login_history"("session_id", "device_id");

-- CreateIndex
CREATE INDEX "idx_user_id_timestamp" ON "login_history"("user_id", "timestamp");

-- CreateIndex
CREATE INDEX "idx_field_parent_id" ON "metabase_field"("parent_id");

-- CreateIndex
CREATE INDEX "idx_field_table_id" ON "metabase_field"("table_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_uniq_field_table_id_parent_id_name" ON "metabase_field"("table_id", "parent_id", "name");

-- CreateIndex
CREATE INDEX "idx_fieldvalues_field_id" ON "metabase_fieldvalues"("field_id");

-- CreateIndex
CREATE INDEX "idx_metabase_table_db_id_schema" ON "metabase_table"("db_id", "schema");

-- CreateIndex
CREATE INDEX "idx_metabase_table_show_in_getting_started" ON "metabase_table"("show_in_getting_started");

-- CreateIndex
CREATE INDEX "idx_table_db_id" ON "metabase_table"("db_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_uniq_table_db_id_schema_name" ON "metabase_table"("db_id", "schema", "name");

-- CreateIndex
CREATE UNIQUE INDEX "metric_entity_id_key" ON "metric"("entity_id");

-- CreateIndex
CREATE INDEX "idx_metric_creator_id" ON "metric"("creator_id");

-- CreateIndex
CREATE INDEX "idx_metric_show_in_getting_started" ON "metric"("show_in_getting_started");

-- CreateIndex
CREATE INDEX "idx_metric_table_id" ON "metric"("table_id");

-- CreateIndex
CREATE INDEX "idx_metric_important_field_field_id" ON "metric_important_field"("field_id");

-- CreateIndex
CREATE INDEX "idx_metric_important_field_metric_id" ON "metric_important_field"("metric_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_metric_important_field_metric_id_field_id" ON "metric_important_field"("metric_id", "field_id");

-- CreateIndex
CREATE INDEX "idx_moderation_review_item_type_item_id" ON "moderation_review"("moderated_item_type", "moderated_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "native_query_snippet_name_key" ON "native_query_snippet"("name");

-- CreateIndex
CREATE UNIQUE INDEX "native_query_snippet_entity_id_key" ON "native_query_snippet"("entity_id");

-- CreateIndex
CREATE INDEX "idx_snippet_collection_id" ON "native_query_snippet"("collection_id");

-- CreateIndex
CREATE INDEX "idx_snippet_name" ON "native_query_snippet"("name");

-- CreateIndex
CREATE UNIQUE INDEX "parameter_card_entity_id_key" ON "parameter_card"("entity_id");

-- CreateIndex
CREATE INDEX "idx_parameter_card_card_id" ON "parameter_card"("card_id");

-- CreateIndex
CREATE INDEX "idx_parameter_card_parameterized_object_id" ON "parameter_card"("parameterized_object_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_parameterized_object_card_parameter" ON "parameter_card"("parameterized_object_id", "parameterized_object_type", "parameter_id");

-- CreateIndex
CREATE INDEX "idx_permissions_group_id" ON "permissions"("group_id");

-- CreateIndex
CREATE INDEX "idx_permissions_group_id_object" ON "permissions"("group_id", "object");

-- CreateIndex
CREATE INDEX "idx_permissions_object" ON "permissions"("object");

-- CreateIndex
CREATE UNIQUE INDEX "permissions_group_id_object_key" ON "permissions"("group_id", "object");

-- CreateIndex
CREATE UNIQUE INDEX "unique_permissions_group_name" ON "permissions_group"("name");

-- CreateIndex
CREATE INDEX "idx_permissions_group_name" ON "permissions_group"("name");

-- CreateIndex
CREATE INDEX "idx_permissions_group_membership_group_id" ON "permissions_group_membership"("group_id");

-- CreateIndex
CREATE INDEX "idx_permissions_group_membership_group_id_user_id" ON "permissions_group_membership"("group_id", "user_id");

-- CreateIndex
CREATE INDEX "idx_permissions_group_membership_user_id" ON "permissions_group_membership"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_permissions_group_membership_user_id_group_id" ON "permissions_group_membership"("user_id", "group_id");

-- CreateIndex
CREATE UNIQUE INDEX "persisted_info_card_id_key" ON "persisted_info"("card_id");

-- CreateIndex
CREATE UNIQUE INDEX "pulse_entity_id_key" ON "pulse"("entity_id");

-- CreateIndex
CREATE INDEX "idx_pulse_collection_id" ON "pulse"("collection_id");

-- CreateIndex
CREATE INDEX "idx_pulse_creator_id" ON "pulse"("creator_id");

-- CreateIndex
CREATE UNIQUE INDEX "pulse_card_entity_id_key" ON "pulse_card"("entity_id");

-- CreateIndex
CREATE INDEX "idx_pulse_card_card_id" ON "pulse_card"("card_id");

-- CreateIndex
CREATE INDEX "idx_pulse_card_pulse_id" ON "pulse_card"("pulse_id");

-- CreateIndex
CREATE UNIQUE INDEX "pulse_channel_entity_id_key" ON "pulse_channel"("entity_id");

-- CreateIndex
CREATE INDEX "idx_pulse_channel_pulse_id" ON "pulse_channel"("pulse_id");

-- CreateIndex
CREATE INDEX "idx_pulse_channel_schedule_type" ON "pulse_channel"("schedule_type");

-- CreateIndex
CREATE INDEX "idx_qrtz_ft_inst_job_req_rcvry" ON "qrtz_fired_triggers"("sched_name", "instance_name", "requests_recovery");

-- CreateIndex
CREATE INDEX "idx_qrtz_ft_j_g" ON "qrtz_fired_triggers"("sched_name", "job_name", "job_group");

-- CreateIndex
CREATE INDEX "idx_qrtz_ft_jg" ON "qrtz_fired_triggers"("sched_name", "job_group");

-- CreateIndex
CREATE INDEX "idx_qrtz_ft_t_g" ON "qrtz_fired_triggers"("sched_name", "trigger_name", "trigger_group");

-- CreateIndex
CREATE INDEX "idx_qrtz_ft_tg" ON "qrtz_fired_triggers"("sched_name", "trigger_group");

-- CreateIndex
CREATE INDEX "idx_qrtz_ft_trig_inst_name" ON "qrtz_fired_triggers"("sched_name", "instance_name");

-- CreateIndex
CREATE INDEX "idx_qrtz_j_grp" ON "qrtz_job_details"("sched_name", "job_group");

-- CreateIndex
CREATE INDEX "idx_qrtz_j_req_recovery" ON "qrtz_job_details"("sched_name", "requests_recovery");

-- CreateIndex
CREATE INDEX "idx_qrtz_t_c" ON "qrtz_triggers"("sched_name", "calendar_name");

-- CreateIndex
CREATE INDEX "idx_qrtz_t_g" ON "qrtz_triggers"("sched_name", "trigger_group");

-- CreateIndex
CREATE INDEX "idx_qrtz_t_j" ON "qrtz_triggers"("sched_name", "job_name", "job_group");

-- CreateIndex
CREATE INDEX "idx_qrtz_t_jg" ON "qrtz_triggers"("sched_name", "job_group");

-- CreateIndex
CREATE INDEX "idx_qrtz_t_n_g_state" ON "qrtz_triggers"("sched_name", "trigger_group", "trigger_state");

-- CreateIndex
CREATE INDEX "idx_qrtz_t_n_state" ON "qrtz_triggers"("sched_name", "trigger_name", "trigger_group", "trigger_state");

-- CreateIndex
CREATE INDEX "idx_qrtz_t_next_fire_time" ON "qrtz_triggers"("sched_name", "next_fire_time");

-- CreateIndex
CREATE INDEX "idx_qrtz_t_nft_misfire" ON "qrtz_triggers"("sched_name", "misfire_instr", "next_fire_time");

-- CreateIndex
CREATE INDEX "idx_qrtz_t_nft_st" ON "qrtz_triggers"("sched_name", "trigger_state", "next_fire_time");

-- CreateIndex
CREATE INDEX "idx_qrtz_t_nft_st_misfire" ON "qrtz_triggers"("sched_name", "misfire_instr", "next_fire_time", "trigger_state");

-- CreateIndex
CREATE INDEX "idx_qrtz_t_nft_st_misfire_grp" ON "qrtz_triggers"("sched_name", "misfire_instr", "next_fire_time", "trigger_group", "trigger_state");

-- CreateIndex
CREATE INDEX "idx_qrtz_t_state" ON "qrtz_triggers"("sched_name", "trigger_state");

-- CreateIndex
CREATE INDEX "idx_query_cache_updated_at" ON "query_cache"("updated_at");

-- CreateIndex
CREATE INDEX "idx_query_execution_card_id" ON "query_execution"("card_id");

-- CreateIndex
CREATE INDEX "idx_query_execution_card_id_started_at" ON "query_execution"("card_id", "started_at");

-- CreateIndex
CREATE INDEX "idx_query_execution_context" ON "query_execution"("context");

-- CreateIndex
CREATE INDEX "idx_query_execution_executor_id" ON "query_execution"("executor_id");

-- CreateIndex
CREATE INDEX "idx_query_execution_query_hash_started_at" ON "query_execution"("hash", "started_at");

-- CreateIndex
CREATE INDEX "idx_query_execution_started_at" ON "query_execution"("started_at");

-- CreateIndex
CREATE UNIQUE INDEX "report_card_public_uuid_key" ON "report_card"("public_uuid");

-- CreateIndex
CREATE UNIQUE INDEX "report_card_entity_id_key" ON "report_card"("entity_id");

-- CreateIndex
CREATE INDEX "idx_card_collection_id" ON "report_card"("collection_id");

-- CreateIndex
CREATE INDEX "idx_card_creator_id" ON "report_card"("creator_id");

-- CreateIndex
CREATE INDEX "idx_card_public_uuid" ON "report_card"("public_uuid");

-- CreateIndex
CREATE INDEX "idx_cardfavorite_card_id" ON "report_cardfavorite"("card_id");

-- CreateIndex
CREATE INDEX "idx_cardfavorite_owner_id" ON "report_cardfavorite"("owner_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_unique_cardfavorite_card_id_owner_id" ON "report_cardfavorite"("card_id", "owner_id");

-- CreateIndex
CREATE UNIQUE INDEX "report_dashboard_public_uuid_key" ON "report_dashboard"("public_uuid");

-- CreateIndex
CREATE UNIQUE INDEX "report_dashboard_entity_id_key" ON "report_dashboard"("entity_id");

-- CreateIndex
CREATE INDEX "idx_dashboard_collection_id" ON "report_dashboard"("collection_id");

-- CreateIndex
CREATE INDEX "idx_dashboard_creator_id" ON "report_dashboard"("creator_id");

-- CreateIndex
CREATE INDEX "idx_dashboard_public_uuid" ON "report_dashboard"("public_uuid");

-- CreateIndex
CREATE INDEX "idx_report_dashboard_show_in_getting_started" ON "report_dashboard"("show_in_getting_started");

-- CreateIndex
CREATE UNIQUE INDEX "report_dashboardcard_entity_id_key" ON "report_dashboardcard"("entity_id");

-- CreateIndex
CREATE INDEX "idx_dashboardcard_card_id" ON "report_dashboardcard"("card_id");

-- CreateIndex
CREATE INDEX "idx_dashboardcard_dashboard_id" ON "report_dashboardcard"("dashboard_id");

-- CreateIndex
CREATE INDEX "idx_revision_model_model_id" ON "revision"("model", "model_id");

-- CreateIndex
CREATE INDEX "idx_gtap_table_id_group_id" ON "sandboxes"("table_id", "group_id");

-- CreateIndex
CREATE UNIQUE INDEX "unique_gtap_table_id_group_id" ON "sandboxes"("table_id", "group_id");

-- CreateIndex
CREATE UNIQUE INDEX "segment_entity_id_key" ON "segment"("entity_id");

-- CreateIndex
CREATE INDEX "idx_segment_creator_id" ON "segment"("creator_id");

-- CreateIndex
CREATE INDEX "idx_segment_show_in_getting_started" ON "segment"("show_in_getting_started");

-- CreateIndex
CREATE INDEX "idx_segment_table_id" ON "segment"("table_id");

-- CreateIndex
CREATE INDEX "idx_task_history_db_id" ON "task_history"("db_id");

-- CreateIndex
CREATE INDEX "idx_task_history_end_time" ON "task_history"("ended_at");

-- CreateIndex
CREATE UNIQUE INDEX "timeline_entity_id_key" ON "timeline"("entity_id");

-- CreateIndex
CREATE INDEX "idx_timeline_collection_id" ON "timeline"("collection_id");

-- CreateIndex
CREATE INDEX "idx_timeline_event_timeline_id" ON "timeline_event"("timeline_id");

-- CreateIndex
CREATE INDEX "idx_timeline_event_timeline_id_timestamp" ON "timeline_event"("timeline_id", "timestamp");

-- CreateIndex
CREATE INDEX "idx_view_log_timestamp" ON "view_log"("model_id");

-- CreateIndex
CREATE INDEX "idx_view_log_user_id" ON "view_log"("user_id");

-- AddForeignKey
ALTER TABLE "action" ADD CONSTRAINT "fk_action_creator_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "action" ADD CONSTRAINT "fk_action_made_public_by_id" FOREIGN KEY ("made_public_by_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "action" ADD CONSTRAINT "fk_action_model_id" FOREIGN KEY ("model_id") REFERENCES "report_card"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "activity" ADD CONSTRAINT "fk_activity_ref_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "application_permissions_revision" ADD CONSTRAINT "fk_general_permissions_revision_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "bookmark_ordering" ADD CONSTRAINT "fk_bookmark_ordering_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_bookmark" ADD CONSTRAINT "fk_card_bookmark_dashboard_id" FOREIGN KEY ("card_id") REFERENCES "report_card"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_bookmark" ADD CONSTRAINT "fk_card_bookmark_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_label" ADD CONSTRAINT "fk_card_label_ref_card_id" FOREIGN KEY ("card_id") REFERENCES "report_card"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_label" ADD CONSTRAINT "fk_card_label_ref_label_id" FOREIGN KEY ("label_id") REFERENCES "label"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "collection" ADD CONSTRAINT "fk_collection_personal_owner_id" FOREIGN KEY ("personal_owner_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "collection_bookmark" ADD CONSTRAINT "fk_collection_bookmark_collection_id" FOREIGN KEY ("collection_id") REFERENCES "collection"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "collection_bookmark" ADD CONSTRAINT "fk_collection_bookmark_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "collection_permission_graph_revision" ADD CONSTRAINT "fk_collection_revision_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "computation_job" ADD CONSTRAINT "fk_computation_job_ref_user_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "computation_job_result" ADD CONSTRAINT "fk_computation_result_ref_job_id" FOREIGN KEY ("job_id") REFERENCES "computation_job"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "core_session" ADD CONSTRAINT "fk_session_ref_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "core_tests" ADD CONSTRAINT "core_tests_framid_fkey" FOREIGN KEY ("framid") REFERENCES "participants"("framid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "dashboard_bookmark" ADD CONSTRAINT "fk_dashboard_bookmark_dashboard_id" FOREIGN KEY ("dashboard_id") REFERENCES "report_dashboard"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "dashboard_bookmark" ADD CONSTRAINT "fk_dashboard_bookmark_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "dashboard_favorite" ADD CONSTRAINT "fk_dashboard_favorite_dashboard_id" FOREIGN KEY ("dashboard_id") REFERENCES "report_dashboard"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "dashboard_favorite" ADD CONSTRAINT "fk_dashboard_favorite_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "dashboardcard_series" ADD CONSTRAINT "fk_dashboardcard_series_ref_card_id" FOREIGN KEY ("card_id") REFERENCES "report_card"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "dashboardcard_series" ADD CONSTRAINT "fk_dashboardcard_series_ref_dashboardcard_id" FOREIGN KEY ("dashboardcard_id") REFERENCES "report_dashboardcard"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "dimension" ADD CONSTRAINT "fk_dimension_displayfk_ref_field_id" FOREIGN KEY ("human_readable_field_id") REFERENCES "metabase_field"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "dimension" ADD CONSTRAINT "fk_dimension_ref_field_id" FOREIGN KEY ("field_id") REFERENCES "metabase_field"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "http_action" ADD CONSTRAINT "fk_http_action_ref_action_id" FOREIGN KEY ("action_id") REFERENCES "action"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "implicit_action" ADD CONSTRAINT "fk_implicit_action_action_id" FOREIGN KEY ("action_id") REFERENCES "action"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "login_history" ADD CONSTRAINT "fk_login_history_session_id" FOREIGN KEY ("session_id") REFERENCES "core_session"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "login_history" ADD CONSTRAINT "fk_login_history_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "metabase_database" ADD CONSTRAINT "fk_database_creator_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "metabase_field" ADD CONSTRAINT "fk_field_parent_ref_field_id" FOREIGN KEY ("parent_id") REFERENCES "metabase_field"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "metabase_field" ADD CONSTRAINT "fk_field_ref_table_id" FOREIGN KEY ("table_id") REFERENCES "metabase_table"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "metabase_fieldvalues" ADD CONSTRAINT "fk_fieldvalues_ref_field_id" FOREIGN KEY ("field_id") REFERENCES "metabase_field"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "metabase_table" ADD CONSTRAINT "fk_table_ref_database_id" FOREIGN KEY ("db_id") REFERENCES "metabase_database"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "metric" ADD CONSTRAINT "fk_metric_ref_creator_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "metric" ADD CONSTRAINT "fk_metric_ref_table_id" FOREIGN KEY ("table_id") REFERENCES "metabase_table"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "metric_important_field" ADD CONSTRAINT "fk_metric_important_field_metabase_field_id" FOREIGN KEY ("field_id") REFERENCES "metabase_field"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "metric_important_field" ADD CONSTRAINT "fk_metric_important_field_metric_id" FOREIGN KEY ("metric_id") REFERENCES "metric"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "native_query_snippet" ADD CONSTRAINT "fk_snippet_collection_id" FOREIGN KEY ("collection_id") REFERENCES "collection"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "native_query_snippet" ADD CONSTRAINT "fk_snippet_creator_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parameter_card" ADD CONSTRAINT "fk_parameter_card_ref_card_id" FOREIGN KEY ("card_id") REFERENCES "report_card"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "permissions" ADD CONSTRAINT "fk_permissions_group_id" FOREIGN KEY ("group_id") REFERENCES "permissions_group"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "permissions_group_membership" ADD CONSTRAINT "fk_permissions_group_group_id" FOREIGN KEY ("group_id") REFERENCES "permissions_group"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "permissions_group_membership" ADD CONSTRAINT "fk_permissions_group_membership_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "permissions_revision" ADD CONSTRAINT "fk_permissions_revision_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "persisted_info" ADD CONSTRAINT "fk_persisted_info_card_id" FOREIGN KEY ("card_id") REFERENCES "report_card"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "persisted_info" ADD CONSTRAINT "fk_persisted_info_database_id" FOREIGN KEY ("database_id") REFERENCES "metabase_database"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "persisted_info" ADD CONSTRAINT "fk_persisted_info_ref_creator_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pulse" ADD CONSTRAINT "fk_pulse_collection_id" FOREIGN KEY ("collection_id") REFERENCES "collection"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pulse" ADD CONSTRAINT "fk_pulse_ref_creator_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pulse" ADD CONSTRAINT "fk_pulse_ref_dashboard_id" FOREIGN KEY ("dashboard_id") REFERENCES "report_dashboard"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pulse_card" ADD CONSTRAINT "fk_pulse_card_ref_card_id" FOREIGN KEY ("card_id") REFERENCES "report_card"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pulse_card" ADD CONSTRAINT "fk_pulse_card_ref_pulse_card_id" FOREIGN KEY ("dashboard_card_id") REFERENCES "report_dashboardcard"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pulse_card" ADD CONSTRAINT "fk_pulse_card_ref_pulse_id" FOREIGN KEY ("pulse_id") REFERENCES "pulse"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pulse_channel" ADD CONSTRAINT "fk_pulse_channel_ref_pulse_id" FOREIGN KEY ("pulse_id") REFERENCES "pulse"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pulse_channel_recipient" ADD CONSTRAINT "fk_pulse_channel_recipient_ref_pulse_channel_id" FOREIGN KEY ("pulse_channel_id") REFERENCES "pulse_channel"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pulse_channel_recipient" ADD CONSTRAINT "fk_pulse_channel_recipient_ref_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "qrtz_blob_triggers" ADD CONSTRAINT "fk_qrtz_blob_triggers_triggers" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "qrtz_triggers"("sched_name", "trigger_name", "trigger_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "qrtz_cron_triggers" ADD CONSTRAINT "fk_qrtz_cron_triggers_triggers" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "qrtz_triggers"("sched_name", "trigger_name", "trigger_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "qrtz_simple_triggers" ADD CONSTRAINT "fk_qrtz_simple_triggers_triggers" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "qrtz_triggers"("sched_name", "trigger_name", "trigger_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "qrtz_simprop_triggers" ADD CONSTRAINT "fk_qrtz_simprop_triggers_triggers" FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "qrtz_triggers"("sched_name", "trigger_name", "trigger_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "qrtz_triggers" ADD CONSTRAINT "fk_qrtz_triggers_job_details" FOREIGN KEY ("sched_name", "job_name", "job_group") REFERENCES "qrtz_job_details"("sched_name", "job_name", "job_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "query_action" ADD CONSTRAINT "fk_query_action_database_id" FOREIGN KEY ("database_id") REFERENCES "metabase_database"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "query_action" ADD CONSTRAINT "fk_query_action_ref_action_id" FOREIGN KEY ("action_id") REFERENCES "action"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_card" ADD CONSTRAINT "fk_card_collection_id" FOREIGN KEY ("collection_id") REFERENCES "collection"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_card" ADD CONSTRAINT "fk_card_made_public_by_id" FOREIGN KEY ("made_public_by_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_card" ADD CONSTRAINT "fk_card_ref_user_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_card" ADD CONSTRAINT "fk_report_card_ref_database_id" FOREIGN KEY ("database_id") REFERENCES "metabase_database"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_card" ADD CONSTRAINT "fk_report_card_ref_table_id" FOREIGN KEY ("table_id") REFERENCES "metabase_table"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_cardfavorite" ADD CONSTRAINT "fk_cardfavorite_ref_card_id" FOREIGN KEY ("card_id") REFERENCES "report_card"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_cardfavorite" ADD CONSTRAINT "fk_cardfavorite_ref_user_id" FOREIGN KEY ("owner_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_dashboard" ADD CONSTRAINT "fk_dashboard_collection_id" FOREIGN KEY ("collection_id") REFERENCES "collection"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_dashboard" ADD CONSTRAINT "fk_dashboard_made_public_by_id" FOREIGN KEY ("made_public_by_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_dashboard" ADD CONSTRAINT "fk_dashboard_ref_user_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_dashboardcard" ADD CONSTRAINT "fk_dashboardcard_ref_card_id" FOREIGN KEY ("card_id") REFERENCES "report_card"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_dashboardcard" ADD CONSTRAINT "fk_dashboardcard_ref_dashboard_id" FOREIGN KEY ("dashboard_id") REFERENCES "report_dashboard"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_dashboardcard" ADD CONSTRAINT "fk_report_dashboardcard_ref_action_id" FOREIGN KEY ("action_id") REFERENCES "action"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "revision" ADD CONSTRAINT "fk_revision_ref_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sandboxes" ADD CONSTRAINT "fk_gtap_card_id" FOREIGN KEY ("card_id") REFERENCES "report_card"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sandboxes" ADD CONSTRAINT "fk_gtap_group_id" FOREIGN KEY ("group_id") REFERENCES "permissions_group"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sandboxes" ADD CONSTRAINT "fk_gtap_table_id" FOREIGN KEY ("table_id") REFERENCES "metabase_table"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sandboxes" ADD CONSTRAINT "fk_sandboxes_ref_permissions" FOREIGN KEY ("permission_id") REFERENCES "permissions"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "secret" ADD CONSTRAINT "fk_secret_ref_user_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "segment" ADD CONSTRAINT "fk_segment_ref_creator_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "segment" ADD CONSTRAINT "fk_segment_ref_table_id" FOREIGN KEY ("table_id") REFERENCES "metabase_table"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "timeline" ADD CONSTRAINT "fk_timeline_collection_id" FOREIGN KEY ("collection_id") REFERENCES "collection"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "timeline" ADD CONSTRAINT "fk_timeline_creator_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "timeline_event" ADD CONSTRAINT "fk_event_creator_id" FOREIGN KEY ("creator_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "timeline_event" ADD CONSTRAINT "fk_events_timeline_id" FOREIGN KEY ("timeline_id") REFERENCES "timeline"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "view_log" ADD CONSTRAINT "fk_view_log_ref_user_id" FOREIGN KEY ("user_id") REFERENCES "core_user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

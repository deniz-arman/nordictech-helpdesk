
/*
=========================================================
PROJECT: NordicTech Helpdesk
FILE: 02_sample_data.sql

PURPOSE:
Insert synthetic sample records into the helpdesk database.

PREREQUISITE:
Run 01_database_schema_clean.sql first
on a fresh database.

NOTE:
All data is fictional and used for portfolio purposes.
=========================================================
*/

USE [NordicTech_Helpdesk];
GO

-- ========================================
-- 01. INSERT USERS
-- ========================================

INSERT INTO dbo.users
    (user_id, first_name, last_name, department, office_location)
VALUES
    (101, N'Erik', N'Andersson', N'Finance', N'Kalmar'),
    (102, N'Anna', N'Svensson', N'HR', N'Växjö'),
    (103, N'Emil', N'Nilsson', N'Sales', N'Nybro'),
    (104, N'Maria', N'Lindberg', N'IT', N'Kalmar'),
    (105, N'Christian', N'Söderström', N'Finance', NULL);


-- ========================================
-- 02. INSERT TECHNICIANS
-- ========================================

INSERT INTO dbo.technicians
    (technician_id, first_name, last_name, support_level, team)
VALUES
    (201, N'Johan', N'Bergström', 'L1', 'Service Desk'),
    (202, N'Sofia', N'Lindgren', 'L2', 'Technical Support'),
    (203, N'Marcus', N'Ekström', 'L3', 'Infrastructure');



-- ========================================
-- 03. INSERT TICKETS
-- ========================================

INSERT INTO dbo.tickets
    (ticket_id, user_id, technician_id,
     incident_type, priority, status,
     created_at, resolved_at)
VALUES
    (1001, 101, 201, 'Network', 'High', 'Resolved',
     '2026-09-01T08:30:00', '2026-09-01T11:45:00'),

    (1002, 102, 202, 'Software', 'Medium', 'In Progress',
     '2026-09-02T09:15:00', NULL),

    (1003, 103, 201, 'Hardware', 'Low', 'Closed',
     '2026-09-03T10:00:00', '2026-09-03T13:20:00'),

    (1004, 104, 203, 'Access', 'High', 'Escalated',
     '2026-09-04T08:00:00', NULL),

    (1005, 105, NULL, 'Network', 'Critical', 'Open',
     '2026-09-05T14:30:00', NULL),

    (1006, 101, 202, 'Software', 'Low', 'Resolved',
     '2026-09-07T11:00:00', '2026-09-07T12:15:00'),

    (1007, 102, 203, 'Hardware', 'Medium', 'Resolved',
     '2026-09-08T09:45:00', '2026-09-09T10:30:00'),

    (1008, 103, NULL, 'Access', 'Medium', 'Open',
     '2026-09-09T13:00:00', NULL),

    (1009, 104, 202, 'Network', 'Critical', 'In Progress',
     '2026-09-10T08:20:00', NULL),

    (1010, 105, 202, 'Software', 'High', 'Closed',
     '2026-09-11T15:10:00', '2026-09-14T09:00:00');



-- ========================================
-- 04. INSERT TICKET UPDATES
-- ========================================

INSERT INTO dbo.ticket_updates
    (update_id, ticket_id, technician_id,
     previous_status, new_status,
     update_note, updated_at)
VALUES
    (1, 1001, 201, 'Open', 'In Progress',
     'Started network troubleshooting',
     '2026-09-01T08:45:00'),

    (2, 1001, 201, 'In Progress', 'Resolved',
     'Network connection restored',
     '2026-09-01T11:45:00'),

    (3, 1002, 202, 'Open', 'In Progress',
     'Investigating software error',
     '2026-09-02T09:30:00'),

    (4, 1003, 201, 'Open', 'In Progress',
     'Hardware diagnostics started',
     '2026-09-03T10:15:00'),

    (5, 1003, 201, 'In Progress', 'Closed',
     'Hardware replaced and tested',
     '2026-09-03T13:20:00');



-- ========================================
-- 05. INSERT ESCALATIONS
-- ========================================

INSERT INTO dbo.escalations
    (escalation_id, ticket_id,
     from_technician_id, to_technician_id,
     escalation_reason, escalate_date)
VALUES
    (1, 1004, 202, 203,
     'Advanced access permissions required',
     '2026-09-04T09:30:00'),

    (2, 1009, 201, 202,
     'Complex network issue requires L2 support',
     '2026-09-10T10:00:00'),

    (3, 1002, 201, 202,
     'Software issue requires specialist investigation',
     '2026-09-02T09:20:00');

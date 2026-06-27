--
-- PostgreSQL database dump
--

\restrict 49Kt9WgGThzb4YGf6S85HJjzP0UGHg44lpevbbNG4tOKQBBZLlrbpXblKqaAAgK

-- Dumped from database version 16.11 (Homebrew)
-- Dumped by pg_dump version 16.11 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: WorksheetTemplate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorksheetTemplate" (id, "createdAt", name, "displayTitle", "problemType", "totalProblems", "requiredTags", "excludedTags", tips, "easyCount", "hardCount", "mediumCount", "updatedAt") FROM stdin;
\.


--
-- Data for Name: GeneratedWorksheet; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."GeneratedWorksheet" (id, "createdAt", title, "templateId", seed, "pdfPath") FROM stdin;
\.


--
-- Data for Name: Problem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Problem" (id, "createdAt", "updatedAt", question, answer, type, difficulty, tags) FROM stdin;
c8ddfa3c-e810-4357-b6fa-2310ccb8d62c	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	5 × 1	5	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
d4828372-1d85-49d3-93d4-640aa82ee723	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	3 × 4	12	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
bcb7727f-7275-481e-8a77-f6e30288fb4c	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	7 × 2	14	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
cmk37a6u90001u2l7ul0br4rr	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 40°.	50°	ANGLES	EASY	{complementary,basic}
cmk37a6u90002u2l70kb3wfxe	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 110°.	70°	ANGLES	EASY	{supplementary,basic}
cmk37a6u90003u2l7rypi3vov	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 75°.	105°	ANGLES	EASY	{supplementary,basic}
cmk37a6u90004u2l7zp4goq1b	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 130° and x°. Find x.	50°	ANGLES	EASY	{straight-line,basic}
cmk37a6u90005u2l7xdnhe7iv	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 95° and x°. Find x.	85°	ANGLES	EASY	{straight-line,basic}
cmk37a6u90006u2l7idr3ailv	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 90°, 120°, and x°. Find x.	150°	ANGLES	EASY	{around-point,basic}
cmk37a6u90007u2l793cxkd1t	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 80°, 100°, 110°, and x°. Find x.	70°	ANGLES	EASY	{around-point,basic}
cmk37a6u90008u2l715x4bz3n	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 60° and 80°. Find the third angle.	40°	ANGLES	EASY	{triangle,angle-sum}
cmk37a6u90009u2l7y1wmkv9j	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 45° and 75°. Find the third angle.	60°	ANGLES	EASY	{triangle,angle-sum}
cmk37a6u9000au2l77epb2ujg	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 30°.	60°	ANGLES	EASY	{complementary,basic}
cmk37a6u9000bu2l75jn66bq3	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 55°.	35°	ANGLES	EASY	{complementary,basic}
cmk37a6u9000cu2l758456u60	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 120°.	60°	ANGLES	EASY	{supplementary,basic}
cmk37a6u9000du2l70rqojem3	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 85°.	95°	ANGLES	EASY	{supplementary,basic}
cmk37a6u9000eu2l7f2lyf0lr	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 145° and x°. Find x.	35°	ANGLES	EASY	{straight-line,basic}
cmk37a6u9000fu2l7c1xm7qlu	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 100° and x°. Find x.	80°	ANGLES	EASY	{straight-line,basic}
cmk37a6u9000gu2l7hqrei2c8	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 85°, 95°, 105°, and x°. Find x.	75°	ANGLES	EASY	{around-point,basic}
cmk37a6u9000hu2l7ix4tmxyo	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 100°, 110°, and x°. Find x.	150°	ANGLES	EASY	{around-point,basic}
cmk37a6u9000iu2l76hjb0iuv	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 50° and 70°. Find the third angle.	60°	ANGLES	EASY	{triangle,angle-sum}
cmk37a6u9000ju2l7af5z0hwj	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 55° and 85°. Find the third angle.	40°	ANGLES	EASY	{triangle,angle-sum}
cmk37a6u9000ku2l7upmhfjxv	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 35°.	55°	ANGLES	EASY	{complementary,basic}
cmk37a6u9000lu2l794bf7nmg	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 60°.	30°	ANGLES	EASY	{complementary,basic}
cmk37a6u9000mu2l7ye5wkscv	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 90°.	90°	ANGLES	EASY	{supplementary,basic}
cmk37a6u9000nu2l744ydtk21	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 65°.	115°	ANGLES	EASY	{supplementary,basic}
cmk37a6u9000ou2l7bo2bsduk	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 115° and x°. Find x.	65°	ANGLES	EASY	{straight-line,basic}
cmk37a6u9000pu2l7pvvhnx62	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 125° and x°. Find x.	55°	ANGLES	EASY	{straight-line,basic}
cmk37a6u9000qu2l79o11m1ju	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 70°, 110°, 120°, and x°. Find x.	60°	ANGLES	EASY	{around-point,basic}
cmk37a6u9000ru2l7bt699ito	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 90°, 90°, 90°, and x°. Find x.	90°	ANGLES	EASY	{around-point,basic}
cmk37a6u9000su2l7cja7cz36	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 65° and 65°. Find the third angle.	50°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u9000tu2l7xqjj4de9	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 70° and 40°. Find the third angle.	70°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u9000uu2l7vb5uscku	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 45°.	45°	ANGLES	EASY	{complementary,basic}
cmk37a6u9000vu2l7re73ysh3	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 20°.	70°	ANGLES	EASY	{complementary,basic}
cmk37a6u9000wu2l7xo4u5p49	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 135°.	45°	ANGLES	EASY	{supplementary,basic}
cmk37a6u9000xu2l7662lm42l	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 95°.	85°	ANGLES	EASY	{supplementary,basic}
cmk37a6u9000yu2l7x0dp1390	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 140° and x°. Find x.	40°	ANGLES	EASY	{straight-line,basic}
cmk37a6u9000zu2l7imyz25my	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 105° and x°. Find x.	75°	ANGLES	EASY	{straight-line,basic}
cmk37a6u90010u2l7otkq8m51	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 60°, 120°, 120°, and x°. Find x.	60°	ANGLES	EASY	{around-point,basic}
85959521-3b25-441d-bbb5-9b1900d50e69	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	6 × 5	30	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
31b09161-2cc7-40f3-bd2b-f4d0e3e2f0bf	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	9 × 3	27	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
c6f88996-0f65-4e55-b1da-73399a30c317	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	8 × 4	32	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
cmk37a6u90012u2l70yy80iyn	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 90° and 35°. Find the third angle.	55°	ANGLES	EASY	{triangle,angle-sum,right-triangle}
cmk37a6u90013u2l7o6oa0nr5	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 90° and 50°. Find the third angle.	40°	ANGLES	EASY	{triangle,angle-sum,right-triangle}
cmk37a6u90014u2l7awqt91wn	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 15°.	75°	ANGLES	EASY	{complementary,basic}
cmk37a6u90015u2l7c2rofcod	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 70°.	20°	ANGLES	EASY	{complementary,basic}
cmk37a6u90016u2l70tsi0fgl	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 100°.	80°	ANGLES	EASY	{supplementary,basic}
cmk37a6u90017u2l7bjikdk3q	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 55°.	125°	ANGLES	EASY	{supplementary,basic}
cmk37a6u90018u2l7yler204z	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 150° and x°. Find x.	30°	ANGLES	EASY	{straight-line,basic}
cmk37a6u90019u2l71wqybzhn	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 135° and x°. Find x.	45°	ANGLES	EASY	{straight-line,basic}
cmk37a6u9001au2l7bjez9vyq	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 50°, 100°, 150°, and x°. Find x.	60°	ANGLES	EASY	{around-point,basic}
cmk37a6u9001bu2l7kt0xoc9d	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 45°, 135°, 90°, and x°. Find x.	90°	ANGLES	EASY	{around-point,basic}
cmk37a6u9001cu2l79wfnuc8y	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 100° and 30°. Find the third angle.	50°	ANGLES	EASY	{triangle,angle-sum}
cmk37a6u9001du2l732ablvx6	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 110° and 35°. Find the third angle.	35°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u9001eu2l7v6yn75z2	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, the two equal angles are each 50°. Find the third angle.	80°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u9001fu2l7iupgdl6x	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, the two equal angles are each 65°. Find the third angle.	50°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u9001gu2l7bzdzvsl9	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an equilateral triangle, find each angle.	60°	ANGLES	EASY	{triangle,angle-sum,equilateral}
cmk37a6u9001hu2l72qrzkjon	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a right-angled triangle, one acute angle is 30°. Find the other acute angle.	60°	ANGLES	EASY	{triangle,angle-sum,right-triangle}
cmk37a6u9001iu2l74c2lu8cd	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a right-angled triangle, one acute angle is 45°. Find the other acute angle.	45°	ANGLES	EASY	{triangle,angle-sum,right-triangle}
cmk37a6u9001ju2l7qjj11lik	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a right-angled triangle, one acute angle is 25°. Find the other acute angle.	65°	ANGLES	EASY	{triangle,angle-sum,right-triangle}
cmk37a6u9001ku2l729ak3hdb	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a right-angled triangle, one acute angle is 40°. Find the other acute angle.	50°	ANGLES	EASY	{triangle,angle-sum,right-triangle}
cmk37a6u9001lu2l7vec0c05g	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a right-angled triangle, one acute angle is 55°. Find the other acute angle.	35°	ANGLES	EASY	{triangle,angle-sum,right-triangle}
cmk37a6u9001mu2l7i338w12w	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a right-angled triangle, one acute angle is 20°. Find the other acute angle.	70°	ANGLES	EASY	{triangle,angle-sum,right-triangle}
cmk37a6u9001nu2l7y37vezed	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a right-angled triangle, one acute angle is 35°. Find the other acute angle.	55°	ANGLES	EASY	{triangle,angle-sum,right-triangle}
cmk37a6u9001ou2l75hr4qm19	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 10°.	80°	ANGLES	EASY	{complementary,basic}
cmk37a6u9001pu2l7tzt375dm	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 75°.	15°	ANGLES	EASY	{complementary,basic}
cmk37a6u9001qu2l7jwsstxmj	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 140°.	40°	ANGLES	EASY	{supplementary,basic}
cmk37a6u9001ru2l71ip1eiud	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 45°.	135°	ANGLES	EASY	{supplementary,basic}
cmk37a6u9001su2l7fvd4mj82	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 155° and x°. Find x.	25°	ANGLES	EASY	{straight-line,basic}
cmk37a6u9001tu2l7grg6qd45	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 70° and x°. Find x.	110°	ANGLES	EASY	{straight-line,basic}
cmk37a6u9001uu2l70m9uqgor	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 40°, 80°, 120°, and x°. Find x.	120°	ANGLES	EASY	{around-point,basic}
cmk37a6u9001vu2l7lhxot6x1	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 60°, 100°, 140°, and x°. Find x.	60°	ANGLES	EASY	{around-point,basic}
cmk37a6u9001wu2l7uz5r1a07	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 30° and 120°. Find the third angle.	30°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u9001xu2l7co6axd5i	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 25° and 130°. Find the third angle.	25°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u9001yu2l7a9eyl2fp	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, the two equal angles are each 70°. Find the third angle.	40°	ANGLES	EASY	{triangle,angle-sum,isosceles}
29e80f8b-836a-47f4-ac6f-34b5851ecc1f	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	12 × 6	72	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
9311c3b3-ce25-4084-bbf8-303b8109a3bb	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	11 × 11	121	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
d28f9cb2-1123-4af3-a02b-e507d2cb770b	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	15 × 8	120	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
281d9850-4bd2-41d8-94fd-9fd9d3d0529a	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	14 × 9	126	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
cmk37a6u90020u2l7lkk5tdeb	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, the two equal angles are each 55°. Find the third angle.	70°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u90021u2l7mt23n8on	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, the two equal angles are each 60°. Find the third angle.	60°	ANGLES	EASY	{triangle,angle-sum,equilateral}
cmk37a6u90022u2l7vu35uiqv	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, the two equal angles are each 75°. Find the third angle.	30°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u90023u2l713i6i1cb	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, the two equal angles are each 40°. Find the third angle.	100°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u90024u2l7s2okq3g1	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, the two equal angles are each 35°. Find the third angle.	110°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u90025u2l79jbgzznj	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, the two equal angles are each 80°. Find the third angle.	20°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u90026u2l71t6whh2a	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 5°.	85°	ANGLES	EASY	{complementary,basic}
cmk37a6u90027u2l7v1pzrl62	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 65°.	25°	ANGLES	EASY	{complementary,basic}
cmk37a6u90028u2l7j80jbdct	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 150°.	30°	ANGLES	EASY	{supplementary,basic}
cmk37a6u90029u2l7sm728t28	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 30°.	150°	ANGLES	EASY	{supplementary,basic}
cmk37a6u9002au2l7erohl9ty	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 160° and x°. Find x.	20°	ANGLES	EASY	{straight-line,basic}
cmk37a6u9002bu2l7qnqqdhgq	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 65° and x°. Find x.	115°	ANGLES	EASY	{straight-line,basic}
cmk37a6u9002cu2l78ymndmar	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 30°, 60°, 90°, 120°, and x°. Find x.	60°	ANGLES	EASY	{around-point,basic}
cmk37a6u9002du2l7y6g927wa	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 45°, 90°, 135°, and x°. Find x.	90°	ANGLES	EASY	{around-point,basic}
cmk37a6u9002eu2l7zz6yc59o	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 20° and 140°. Find the third angle.	20°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u9002fu2l7fzn2kban	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 15° and 150°. Find the third angle.	15°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u9002gu2l7sm2tvpp4	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 50°.	40°	ANGLES	EASY	{complementary,basic}
cmk37a6u9002hu2l7i9hfn23g	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 80°.	10°	ANGLES	EASY	{complementary,basic}
cmk37a6u9002iu2l76fyvo1z8	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 105°.	75°	ANGLES	EASY	{supplementary,basic}
cmk37a6u9002ju2l7wapqx7z8	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the supplementary angle of 125°.	55°	ANGLES	EASY	{supplementary,basic}
cmk37a6u9002ku2l7i43pk1zf	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 80° and x°. Find x.	100°	ANGLES	EASY	{straight-line,basic}
cmk37a6u9002lu2l7msmubjgm	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two angles on a straight line are 55° and x°. Find x.	125°	ANGLES	EASY	{straight-line,basic}
cmk37a6u9002mu2l7wp1g0wze	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 55°, 65°, 75°, 85°, and x°. Find x.	80°	ANGLES	EASY	{around-point,basic}
cmk37a6u9002nu2l7c1w6yscm	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 72°, 72°, 72°, 72°, and x°. Find x.	72°	ANGLES	EASY	{around-point,basic}
cmk37a6u9002ou2l768nzld94	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 105° and 40°. Find the third angle.	35°	ANGLES	EASY	{triangle,angle-sum}
cmk37a6u9002pu2l7sq4lb4l5	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 95° and 50°. Find the third angle.	35°	ANGLES	EASY	{triangle,angle-sum}
cmk37a6u9002qu2l7e9xy8duq	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one corresponding angle is 70°, find the other corresponding angle.	70°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6u9002ru2l78hhofgiv	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one corresponding angle is 115°, find the other corresponding angle.	115°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6u9002su2l7sbtlqd0b	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one alternate angle is 65°, find the other alternate angle.	65°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6u9002tu2l7p4i1swha	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one alternate angle is 125°, find the other alternate angle.	125°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6u9002uu2l7oyc2rtwi	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one co-interior angle is 100°, find the other co-interior angle.	80°	ANGLES	MEDIUM	{parallel-lines,co-interior}
cmk37a6u9002vu2l7ndq1wis5	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one co-interior angle is 70°, find the other co-interior angle.	110°	ANGLES	MEDIUM	{parallel-lines,co-interior}
c6b5ff64-eaa3-4786-b5f2-dcd0d6f736cb	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	18 × 3	54	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
2c632583-9cb3-4d7a-8d71-077d65d18ea1	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	13 × 5	65	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
84289da5-27fa-445d-bfea-9c7e397d5912	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	9 × 10	90	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
cmk37a6u9002xu2l76inophln	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal forming angle a = 110°. Find the alternate angle.	110°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6u9002yu2l7rdxw4apo	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 80°, 100°, and 90°. Find the fourth angle.	90°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6u9002zu2l7eyu7rb3q	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 70°, 110°, and 120°. Find the fourth angle.	60°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6u90030u2l7hwwghgjt	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one corresponding angle is 95°, find the other corresponding angle.	95°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6u90031u2l76j1i1tbx	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one corresponding angle is 135°, find the other corresponding angle.	135°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6u90032u2l7pvz8lqia	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one alternate angle is 75°, find the other alternate angle.	75°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6u90033u2l72151bctk	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one alternate angle is 105°, find the other alternate angle.	105°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6u90034u2l7bfs9j8z8	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one co-interior angle is 110°, find the other co-interior angle.	70°	ANGLES	MEDIUM	{parallel-lines,co-interior}
cmk37a6u90035u2l7v2ktws9i	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one co-interior angle is 75°, find the other co-interior angle.	105°	ANGLES	MEDIUM	{parallel-lines,co-interior}
cmk37a6u90036u2l76kqyjdib	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal forming angle a = 85°. Find the corresponding angle.	85°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6u90037u2l7r7a0pi3y	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal forming angle a = 120°. Find the alternate angle.	120°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6u90038u2l7h0lk2qk3	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 85°, 95°, and 100°. Find the fourth angle.	80°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6u90039u2l7xxxe6ajf	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 75°, 105°, and 110°. Find the fourth angle.	70°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6u9003au2l7zj3ue1rq	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one corresponding angle is 60°, find the other corresponding angle.	60°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6u9003bu2l73wyju35g	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one corresponding angle is 140°, find the other corresponding angle.	140°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6u9003cu2l7q15zjfph	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one alternate angle is 55°, find the other alternate angle.	55°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6u9003du2l7j7xtt5k5	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one alternate angle is 130°, find the other alternate angle.	130°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6u9003eu2l7qw2u73zt	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one co-interior angle is 115°, find the other co-interior angle.	65°	ANGLES	MEDIUM	{parallel-lines,co-interior}
cmk37a6u9003fu2l741n5ewo7	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one co-interior angle is 65°, find the other co-interior angle.	115°	ANGLES	MEDIUM	{parallel-lines,co-interior}
cmk37a6u9003gu2l7k5pd1chs	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal forming angle a = 75°. Find the corresponding angle.	75°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6u9003hu2l7nf3b6ah5	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal forming angle a = 130°. Find the alternate angle.	130°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6u9003iu2l7dl347yzx	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 90°, 90°, and 90°. Find the fourth angle.	90°	ANGLES	MEDIUM	{quadrilateral,angle-sum,rectangle}
cmk37a6u9003ju2l7xp2uai7k	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 60°, 120°, and 120°. Find the fourth angle.	60°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6u9003ku2l7wqg1vsg1	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one corresponding angle is 50°, find the other corresponding angle.	50°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6u9003lu2l7gbj8gkrv	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one corresponding angle is 145°, find the other corresponding angle.	145°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6u9003mu2l7veluo8a6	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one alternate angle is 45°, find the other alternate angle.	45°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6u9003nu2l7cyoe96oh	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one alternate angle is 135°, find the other alternate angle.	135°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6u9003ou2l7r7pvcqq7	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one co-interior angle is 120°, find the other co-interior angle.	60°	ANGLES	MEDIUM	{parallel-lines,co-interior}
c2c4c617-1409-452d-9882-f9f4cf49a0bc	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	17 × 7	119	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
60fcd0c5-4db9-41d5-8659-33fa513dcef1	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	21 × 4	84	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
a0b07659-6c58-42ba-b5d8-43da254bfd0a	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	4 × (−2)	−8	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
4ef7b19b-faab-41ed-8406-00721df21839	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	2 × (−9)	−18	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
cmk37a6ua003qu2l74avftcvk	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal forming angle a = 65°. Find the corresponding angle.	65°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6ua003ru2l7cpn11mtn	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal forming angle a = 140°. Find the alternate angle.	140°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6ua003su2l7unkhdkg6	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 65°, 115°, and 115°. Find the fourth angle.	65°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6ua003tu2l7khmhthqc	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 55°, 125°, and 125°. Find the fourth angle.	55°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6ua003uu2l7u8g15kaa	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 70°. Find the opposite angle.	70°	ANGLES	MEDIUM	{parallelogram,opposite-angles}
cmk37a6ua003vu2l72q4yxzdv	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 110°. Find the opposite angle.	110°	ANGLES	MEDIUM	{parallelogram,opposite-angles}
cmk37a6ua003wu2l77fkb9sfq	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 80°. Find an adjacent angle.	100°	ANGLES	MEDIUM	{parallelogram,adjacent-angles}
cmk37a6ua003xu2l788o3vedk	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 120°. Find an adjacent angle.	60°	ANGLES	MEDIUM	{parallelogram,adjacent-angles}
cmk37a6ua003yu2l7tpizulxx	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a rhombus, one angle is 60°. Find the opposite angle.	60°	ANGLES	MEDIUM	{rhombus,opposite-angles}
cmk37a6ua003zu2l7mqvg108y	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a rhombus, one angle is 100°. Find an adjacent angle.	80°	ANGLES	MEDIUM	{rhombus,adjacent-angles}
cmk37a6ua0040u2l7bfascglu	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a kite, two adjacent angles are 90° and 120°. One of the remaining angles is 90°. Find the fourth angle.	60°	ANGLES	MEDIUM	{kite,angle-sum}
cmk37a6ua0041u2l7w57nu0a2	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a trapezium, three angles are 70°, 110°, and 110°. Find the fourth angle.	70°	ANGLES	MEDIUM	{trapezium,angle-sum}
cmk37a6ua0042u2l7fbdbpxov	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one co-interior angle is 85°, find the other co-interior angle.	95°	ANGLES	MEDIUM	{parallel-lines,co-interior}
cmk37a6ua0043u2l7gpx09c9a	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one co-interior angle is 95°, find the other co-interior angle.	85°	ANGLES	MEDIUM	{parallel-lines,co-interior}
cmk37a6ua0044u2l70j57cwrs	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 65°. Find the opposite angle.	65°	ANGLES	MEDIUM	{parallelogram,opposite-angles}
cmk37a6ua0045u2l731ywni8w	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 115°. Find the opposite angle.	115°	ANGLES	MEDIUM	{parallelogram,opposite-angles}
cmk37a6ua0046u2l7hw0c0b76	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 75°. Find an adjacent angle.	105°	ANGLES	MEDIUM	{parallelogram,adjacent-angles}
cmk37a6ua0047u2l77wiy87hs	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 125°. Find an adjacent angle.	55°	ANGLES	MEDIUM	{parallelogram,adjacent-angles}
cmk37a6ua0048u2l7j595ujpg	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a rhombus, one angle is 70°. Find the opposite angle.	70°	ANGLES	MEDIUM	{rhombus,opposite-angles}
cmk37a6ua0049u2l72pyltzo3	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a rhombus, one angle is 110°. Find an adjacent angle.	70°	ANGLES	MEDIUM	{rhombus,adjacent-angles}
cmk37a6ua004au2l7wfultphz	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a kite, two adjacent angles are 80° and 100°. One of the remaining angles is 80°. Find the fourth angle.	100°	ANGLES	MEDIUM	{kite,angle-sum}
cmk37a6ua004bu2l7pfdty7s8	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a trapezium, three angles are 60°, 120°, and 120°. Find the fourth angle.	60°	ANGLES	MEDIUM	{trapezium,angle-sum}
cmk37a6ua004cu2l7m17vri5p	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 95°, 85°, and 90°. Find the fourth angle.	90°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6ua004du2l7wim5qtle	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 105°, 75°, and 100°. Find the fourth angle.	80°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6ua004eu2l7zmlqtrj5	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 55°. Find the opposite angle.	55°	ANGLES	MEDIUM	{parallelogram,opposite-angles}
cmk37a6ua004fu2l715nursgw	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 125°. Find the opposite angle.	125°	ANGLES	MEDIUM	{parallelogram,opposite-angles}
cmk37a6ua004gu2l7yhr5zr10	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 60°. Find an adjacent angle.	120°	ANGLES	MEDIUM	{parallelogram,adjacent-angles}
cmk37a6ua004hu2l73047jq1g	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 130°. Find an adjacent angle.	50°	ANGLES	MEDIUM	{parallelogram,adjacent-angles}
cmk37a6ua004iu2l78gyqzfqr	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a rhombus, one angle is 80°. Find the opposite angle.	80°	ANGLES	MEDIUM	{rhombus,opposite-angles}
cmk37a6ua004ju2l7xaaa8ggt	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a rhombus, one angle is 120°. Find an adjacent angle.	60°	ANGLES	MEDIUM	{rhombus,adjacent-angles}
cmk37a6ua004ku2l7ddtgqxe7	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a trapezium, three angles are 50°, 130°, and 130°. Find the fourth angle.	50°	ANGLES	MEDIUM	{trapezium,angle-sum}
ddc81241-e3fe-45f1-9c50-0cb5c4cf74eb	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	7 × (−6)	−42	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
70debc71-6bb4-4a1b-8005-2f736e9af56e	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	1 × (−3)	−3	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
cmk37a6ua004mu2l76o8jit6v	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 88°, 92°, and 90°. Find the fourth angle.	90°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6ua004nu2l79b964j6m	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 78°, 102°, and 100°. Find the fourth angle.	80°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6ua004ou2l7iq29xtzt	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 50°. Find the opposite angle.	50°	ANGLES	MEDIUM	{parallelogram,opposite-angles}
cmk37a6ua004pu2l71g3a6uzv	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 130°. Find the opposite angle.	130°	ANGLES	MEDIUM	{parallelogram,opposite-angles}
cmk37a6ua004qu2l7m5uts7tw	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 55°. Find an adjacent angle.	125°	ANGLES	MEDIUM	{parallelogram,adjacent-angles}
cmk37a6ua004ru2l7fcth7i70	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 135°. Find an adjacent angle.	45°	ANGLES	MEDIUM	{parallelogram,adjacent-angles}
cmk37a6ua004su2l73ocz5717	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a rhombus, one angle is 90°. Find the opposite angle.	90°	ANGLES	MEDIUM	{rhombus,opposite-angles,square}
cmk37a6ua004tu2l7t0i2h12y	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a rhombus, one angle is 130°. Find an adjacent angle.	50°	ANGLES	MEDIUM	{rhombus,adjacent-angles}
cmk37a6ua004uu2l7m692aqh5	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a trapezium, three angles are 55°, 125°, and 125°. Find the fourth angle.	55°	ANGLES	MEDIUM	{trapezium,angle-sum}
cmk37a6ua004vu2l7sde1qmds	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a trapezium, three angles are 75°, 105°, and 105°. Find the fourth angle.	75°	ANGLES	MEDIUM	{trapezium,angle-sum}
cmk37a6ua004wu2l7an2sj5lh	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle with angles 3x, 4x, and 5x, find the value of x.	15°	ANGLES	HARD	{triangle,algebra,angle-sum}
cmk37a6ua004xu2l7qlj4xzij	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle with angles 2x, 3x, and 4x, find the value of x.	20°	ANGLES	HARD	{triangle,algebra,angle-sum}
cmk37a6ua004yu2l7mcldbqun	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, one angle is twice another, and the third is 90°. Find the smallest angle.	30°	ANGLES	HARD	{triangle,algebra,angle-sum,right-triangle}
cmk37a6ua004zu2l74aiv1hlw	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, one angle is three times another, and the third is 80°. Find the smallest angle.	25°	ANGLES	HARD	{triangle,algebra,angle-sum}
cmk37a6ua0050u2l713px0m3o	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. An angle is (2x + 10)° and its corresponding angle is 70°. Find x.	30	ANGLES	HARD	{parallel-lines,algebra,corresponding}
cmk37a6ua0051u2l7dxyyzzje	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. An angle is (3x - 15)° and its alternate angle is 90°. Find x.	35	ANGLES	HARD	{parallel-lines,algebra,alternate}
cmk37a6ua0052u2l7tw1og10v	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. Co-interior angles are (2x + 20)° and (3x - 10)°. Find x.	34	ANGLES	HARD	{parallel-lines,algebra,co-interior}
cmk37a6ua0053u2l7rhlun4pq	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is (2x + 10)°. The adjacent angle is (3x - 10)°. Find x.	36	ANGLES	HARD	{parallelogram,algebra,adjacent-angles}
cmk37a6ua0054u2l7tkj7xt58	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, angles are x, 2x, 3x, and 4x. Find the largest angle.	144°	ANGLES	HARD	{quadrilateral,algebra,angle-sum}
cmk37a6ua0055u2l7msnps7cm	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, angles are in the ratio 2:3:4. Find the largest angle.	80°	ANGLES	HARD	{triangle,ratio,angle-sum}
cmk37a6ua0056u2l79gd4l7a6	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle with angles 5x, 3x, and 4x, find the value of x.	15°	ANGLES	HARD	{triangle,algebra,angle-sum}
cmk37a6ua0057u2l725fo8x9i	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle with angles x, 2x, and 3x, find the largest angle.	90°	ANGLES	HARD	{triangle,algebra,angle-sum,right-triangle}
cmk37a6ua0058u2l76d15rgax	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, one angle is 40° more than another, and the third is 80°. Find the smallest angle.	30°	ANGLES	HARD	{triangle,algebra,angle-sum}
cmk37a6ua0059u2l7tw9i23sr	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, one angle is 30° less than another, and the third is 90°. Find the largest angle.	60°	ANGLES	HARD	{triangle,algebra,angle-sum,right-triangle}
cmk37a6ua005au2l79d2prxho	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. An angle is (4x - 20)° and its corresponding angle is 100°. Find x.	30	ANGLES	HARD	{parallel-lines,algebra,corresponding}
cmk37a6ua005bu2l7l9trmhws	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. An angle is (2x + 30)° and its alternate angle is 110°. Find x.	40	ANGLES	HARD	{parallel-lines,algebra,alternate}
cmk37a6ua005cu2l715zgo15c	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. Co-interior angles are (3x + 15)° and (2x + 15)°. Find x.	30	ANGLES	HARD	{parallel-lines,algebra,co-interior}
cmk37a6ua005du2l7xmoonbsg	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is (3x - 5)°. The adjacent angle is (2x + 5)°. Find x.	36	ANGLES	HARD	{parallelogram,algebra,adjacent-angles}
cmk37a6ua005eu2l7zquvrs9g	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, angles are x, x + 20, x + 40, and x + 60. Find the smallest angle.	60°	ANGLES	HARD	{quadrilateral,algebra,angle-sum}
cmk37a6ua005fu2l7wgbkgbnr	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, angles are in the ratio 1:2:3. Find the largest angle.	90°	ANGLES	HARD	{triangle,ratio,angle-sum,right-triangle}
c28319cf-147e-495d-a663-6b1ac336c1a6	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	5 × (−12)	−60	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
9cc3829c-42e2-48b5-88c5-9c0861b6357e	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	8 × (−4)	−32	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
efbebb1f-7856-4bb9-b7ac-50df1adb2318	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	3 × (−15)	−45	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
cmk37a6ua0066u2l7mef1422o	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 35° and 90°. Find the third angle.	55°	ANGLES	EASY	{triangle,angle-sum,right-triangle,set-11}
cmk37a6ua0067u2l77dcljt03	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, two angles are 48° and 82°. Find the third angle.	50°	ANGLES	EASY	{triangle,angle-sum,set-11}
cmk37a6ua005hu2l7h3e7fz6v	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, each equal angle is (3x - 15)° and the third angle is 90°. Find x.	25	ANGLES	HARD	{triangle,algebra,isosceles,right-triangle}
cmk37a6ua005iu2l7n7vc3n7j	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, one angle is 20° more than the second, and 40° more than the third. Find the largest angle.	80°	ANGLES	HARD	{triangle,algebra,angle-sum}
cmk37a6ua005ju2l78jt2zxib	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, one angle is 10° less than the second, and 20° less than the third. Find the smallest angle.	40°	ANGLES	HARD	{triangle,algebra,angle-sum}
cmk37a6ua005ku2l7uyd8jd9y	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. An angle is (5x + 5)° and its corresponding angle is 80°. Find x.	15	ANGLES	HARD	{parallel-lines,algebra,corresponding}
cmk37a6ua005lu2l7tnfdmxpl	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. An angle is (4x + 10)° and its alternate angle is 90°. Find x.	20	ANGLES	HARD	{parallel-lines,algebra,alternate}
cmk37a6ua005mu2l70ebicy1n	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. Co-interior angles are (4x + 10)° and (2x + 50)°. Find x.	20	ANGLES	HARD	{parallel-lines,algebra,co-interior}
cmk37a6ua005nu2l74q7b3nkv	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is (4x - 20)°. The adjacent angle is (2x + 20)°. Find x.	30	ANGLES	HARD	{parallelogram,algebra,adjacent-angles}
cmk37a6ua005ou2l7rfe3by0c	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, angles are 2x, 3x, 4x, and 5x. Find the smallest angle.	51.4°	ANGLES	HARD	{quadrilateral,algebra,angle-sum}
cmk37a6ua005pu2l7zugfvomq	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, angles are in the ratio 3:4:5. Find the smallest angle.	45°	ANGLES	HARD	{triangle,ratio,angle-sum}
cmk37a6ua005qu2l7swhjhgm1	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, each equal angle is (4x - 10)° and the third angle is 100°. Find x.	22.5	ANGLES	HARD	{triangle,algebra,isosceles}
cmk37a6ua005ru2l7rrb7194w	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, each equal angle is (5x + 5)° and the third angle is 60°. Find x.	11	ANGLES	HARD	{triangle,algebra,isosceles,equilateral}
cmk37a6ua005su2l7d7jnzdig	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, one angle is 30° more than the second, and 60° more than the third. Find the largest angle.	90°	ANGLES	HARD	{triangle,algebra,angle-sum,right-triangle}
cmk37a6ua005tu2l7sjblfane	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, one angle is 15° less than the second, and 30° less than the third. Find the largest angle.	75°	ANGLES	HARD	{triangle,algebra,angle-sum}
cmk37a6ua005uu2l7eel08ucx	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. An angle is (6x - 10)° and its corresponding angle is 110°. Find x.	20	ANGLES	HARD	{parallel-lines,algebra,corresponding}
cmk37a6ua005vu2l7246ssc9z	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. An angle is (5x - 5)° and its alternate angle is 120°. Find x.	25	ANGLES	HARD	{parallel-lines,algebra,alternate}
cmk37a6ua005wu2l7ke5zyq4r	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. Co-interior angles are (5x - 10)° and (3x + 30)°. Find x.	20	ANGLES	HARD	{parallel-lines,algebra,co-interior}
cmk37a6ua005xu2l7rfkkbqz3	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is (5x + 10)°. The adjacent angle is (3x + 10)°. Find x.	20	ANGLES	HARD	{parallelogram,algebra,adjacent-angles}
cmk37a6ua005yu2l7yn9b5sps	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, angles are x + 10, x + 30, x + 50, and x + 70. Find the largest angle.	130°	ANGLES	HARD	{quadrilateral,algebra,angle-sum}
cmk37a6ua005zu2l72j84m15i	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, angles are in the ratio 2:5:3. Find the middle-sized angle.	54°	ANGLES	HARD	{triangle,ratio,angle-sum}
cmk37a6ua0060u2l7m24x0hrw	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, the vertex angle is twice each base angle. Find the vertex angle.	90°	ANGLES	HARD	{triangle,algebra,isosceles,right-triangle}
cmk37a6ua0061u2l7wi90axvv	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, the vertex angle is three times each base angle. Find the base angles.	36°	ANGLES	HARD	{triangle,algebra,isosceles}
cmk37a6ua0062u2l78l8febjx	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, the largest angle is 30° more than the middle angle, which is 30° more than the smallest. Find all three angles.	40°, 70°, 70°	ANGLES	HARD	{triangle,algebra,angle-sum}
cmk37a6ua0063u2l7p6sb613l	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a rhombus, one angle is (3x + 20)°. Find x if the adjacent angle is 100°.	20	ANGLES	HARD	{rhombus,algebra,adjacent-angles}
cmk37a6ua0064u2l76le3blaw	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a kite, two equal angles are each (2x + 30)° and one of the other angles is 80°. If the angle sum is 360°, find x.	35	ANGLES	HARD	{kite,algebra,angle-sum}
cmk37a6ua0065u2l75r9xgniw	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, angles are in the ratio 1:3:5. Find the largest angle.	100°	ANGLES	HARD	{triangle,ratio,angle-sum}
cmk37a6ua0068u2l74r2zf0el	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one corresponding angle is 90°, find the other corresponding angle.	90°	ANGLES	MEDIUM	{parallel-lines,corresponding}
3ae98e4c-24d5-48d5-951e-78040086c53c	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	18 × (−5)	−90	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
234640b3-b9ac-482f-833a-8a1d9ac3f4a8	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	6 × (−8)	−48	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
bef4b078-3664-4c9a-b8b0-bc398cfb75fe	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	10 × (−11)	−110	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
cmk37a6ua006au2l7a5ed4uqh	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one alternate angle is 85°, find the other alternate angle.	85°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6ua006bu2l7pr1959m2	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one alternate angle is 115°, find the other alternate angle.	115°	ANGLES	MEDIUM	{parallel-lines,alternate}
cmk37a6ua006cu2l7sykxcvjq	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one co-interior angle is 125°, find the other co-interior angle.	55°	ANGLES	MEDIUM	{parallel-lines,co-interior}
cmk37a6ua006du2l7qwa575gm	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one co-interior angle is 55°, find the other co-interior angle.	125°	ANGLES	MEDIUM	{parallel-lines,co-interior}
cmk37a6ua006eu2l7z21440za	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 72°, 108°, and 108°. Find the fourth angle.	72°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6ua006fu2l7pa6ho0t9	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 68°, 112°, and 112°. Find the fourth angle.	68°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6ua006gu2l7mqo1o2gc	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 45°. Find the opposite angle.	45°	ANGLES	MEDIUM	{parallelogram,opposite-angles}
cmk37a6ua006hu2l7o465xzjh	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 135°. Find the opposite angle.	135°	ANGLES	MEDIUM	{parallelogram,opposite-angles}
cmk37a6ua006iu2l7zwzvgm33	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 45°. Find an adjacent angle.	135°	ANGLES	MEDIUM	{parallelogram,adjacent-angles}
cmk37a6ua006ju2l7fbd53roq	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 140°. Find an adjacent angle.	40°	ANGLES	MEDIUM	{parallelogram,adjacent-angles}
cmk37a6ua006ku2l7spk5bwd5	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a rhombus, one angle is 50°. Find the opposite angle.	50°	ANGLES	MEDIUM	{rhombus,opposite-angles}
cmk37a6ua006lu2l7ets0la5o	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a rhombus, one angle is 140°. Find an adjacent angle.	40°	ANGLES	MEDIUM	{rhombus,adjacent-angles}
cmk37a6ua006mu2l7k2zzm0g0	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a trapezium, three angles are 45°, 135°, and 135°. Find the fourth angle.	45°	ANGLES	MEDIUM	{trapezium,angle-sum}
cmk37a6ua006nu2l73wmkccl1	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a trapezium, three angles are 80°, 100°, and 100°. Find the fourth angle.	80°	ANGLES	MEDIUM	{trapezium,angle-sum}
cmk37a6ua006ou2l7ky0tkcjw	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 82°, 98°, and 92°. Find the fourth angle.	88°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6ua006pu2l7w5eocgau	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a quadrilateral, three angles are 76°, 104°, and 96°. Find the fourth angle.	84°	ANGLES	MEDIUM	{quadrilateral,angle-sum}
cmk37a6ua006qu2l788yl7j8v	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 40°. Find the opposite angle.	40°	ANGLES	MEDIUM	{parallelogram,opposite-angles}
cmk37a6ua006ru2l7h8bja9wi	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 140°. Find the opposite angle.	140°	ANGLES	MEDIUM	{parallelogram,opposite-angles}
cmk37a6ua006su2l7ycju6v45	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 40°. Find an adjacent angle.	140°	ANGLES	MEDIUM	{parallelogram,adjacent-angles}
cmk37a6ua006tu2l7058j1kf4	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a parallelogram, one angle is 145°. Find an adjacent angle.	35°	ANGLES	MEDIUM	{parallelogram,adjacent-angles}
cmk37a6ua006uu2l7yf4ysuke	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle with angles 6x, 4x, and 8x, find the largest angle.	80°	ANGLES	HARD	{triangle,algebra,angle-sum}
cmk37a6ua006vu2l7q89pbale	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, one angle is 50° more than the smallest, and the third is 100°. Find the smallest angle.	15°	ANGLES	HARD	{triangle,algebra,angle-sum}
cmk37a6ua006wu2l7k7p241uz	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. Co-interior angles are (6x - 20)° and (4x + 40)°. Find x.	16	ANGLES	HARD	{parallel-lines,algebra,co-interior}
cmk37a6ua006xu2l77tggqitz	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a triangle, angles are in the ratio 1:4:7. Find the smallest angle.	15°	ANGLES	HARD	{triangle,ratio,angle-sum}
cmk37a6vc006yu2l7805y13yn	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 5m and width 3m.	15 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc006zu2l7skmqx6yx	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 8m and width 4m.	32 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc0070u2l7chjps81s	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a square with side length 6m.	36 m²	AREA	EASY	{square,basic}
cmk37a6vc0071u2l7p3m04c77	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a square with side length 9m.	81 m²	AREA	EASY	{square,basic}
cmk37a6vc0072u2l7h2pb1yel	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a rectangle with length 7m and width 5m.	24 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vc0073u2l7voctz9t3	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a rectangle with length 10m and width 6m.	32 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vc0074u2l79mfcgxce	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a square with side length 8m.	32 m	AREA	EASY	{square,perimeter}
cmk37a6x000uqu2l766r8pel4	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.25 × 8	2	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
c590d43f-b9a1-45e5-a38e-4ba159009f11	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	15 × (−7)	−105	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
4c2724fc-b0ec-4b79-b6d7-26a650b1c0fc	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	21 × (−5)	−105	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
541424d4-6d9e-4cff-a4aa-b417efeeff65	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−3) × 10	−30	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
774fcf91-bd16-4d8e-a322-193e6142266c	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−10) × 15	−150	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
cmk37a6vc0076u2l7gvdavnkn	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 10m and width 2m.	20 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc0077u2l7co4s8o6c	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 12m and width 3m.	36 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc0078u2l7iyyiw4th	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a square with side length 7m.	49 m²	AREA	EASY	{square,basic}
cmk37a6vc0079u2l7ki9tce4e	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a square with side length 10m.	100 m²	AREA	EASY	{square,basic}
cmk37a6vc007au2l78xfhlhrh	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a rectangle with length 15m and width 5m.	40 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vc007bu2l7xb5j7cgk	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a rectangle with length 20m and width 10m.	60 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vc007cu2l7dtfxhha7	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a square with side length 15m.	60 m	AREA	EASY	{square,perimeter}
cmk37a6vc007du2l78hlmcnma	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 6m and width 6m.	36 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc007eu2l72i1ndfcr	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 9m and width 5m.	45 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc007fu2l7ndfqim1o	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a square with side length 4m.	16 m²	AREA	EASY	{square,basic}
cmk37a6vc007gu2l7or6i29pz	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a square with side length 5m.	25 m²	AREA	EASY	{square,basic}
cmk37a6vc007hu2l76h3cpamv	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a square with side length 20m.	80 m	AREA	EASY	{square,perimeter}
cmk37a6vc007iu2l7onu51s0r	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 7m and width 4m.	28 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc007ju2l7evr8me8k	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 11m and width 3m.	33 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc007ku2l7wcotel2a	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a square with side length 11m.	121 m²	AREA	EASY	{square,basic}
cmk37a6vc007lu2l74o4tw4jp	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a square with side length 13m.	169 m²	AREA	EASY	{square,basic}
cmk37a6vc007mu2l7hvpj1kxl	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a rectangle with length 8m and width 3m.	22 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vc007nu2l7ztj7t58o	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a rectangle with length 12m and width 7m.	38 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vc007ou2l70h633544	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a square with side length 9m.	36 m	AREA	EASY	{square,perimeter}
cmk37a6vc007pu2l7jzkji2z0	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a square with side length 14m.	56 m	AREA	EASY	{square,perimeter}
cmk37a6vc007qu2l7dewdm2nz	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 14m and width 5m.	70 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc007ru2l7j9lnm6e3	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 16m and width 4m.	64 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc007su2l7opbm5bmh	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 13m and width 6m.	78 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc007tu2l7gevb8b93	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 15m and width 7m.	105 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc007uu2l76lh3l4ib	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a square with side length 8m.	64 m²	AREA	EASY	{square,basic}
cmk37a6vc007vu2l7ts3hws1z	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a square with side length 12m.	144 m²	AREA	EASY	{square,basic}
cmk37a6vc007wu2l7mmvqpxe3	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a rectangle with length 9m and width 4m.	26 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vc007xu2l78qdj8qmk	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a rectangle with length 14m and width 8m.	44 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vc007yu2l70mdibbaw	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a square with side length 11m.	44 m	AREA	EASY	{square,perimeter}
cmk37a6vc007zu2l7wazc6src	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a square with side length 13m.	52 m	AREA	EASY	{square,perimeter}
cmk37a6vc0080u2l7e13pgpoo	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 18m and width 5m.	90 m²	AREA	EASY	{rectangle,basic}
cmk37a6vc0081u2l75zwtkjcb	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 20m and width 3m.	60 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd0082u2l7kakcxv2f	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 25m and width 4m.	100 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd0083u2l7v6wvks8t	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 30m and width 2m.	60 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd0084u2l753h0j46k	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a square with side length 14m.	196 m²	AREA	EASY	{square,basic}
371e5977-9648-45c0-87b3-c9fdad93faf2	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−5) × 13	−65	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
b47cdaf6-a2e1-4a51-b222-f8dc7f13f1b7	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−9) × 6	−54	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
e546fc6d-108b-432b-a9d5-0fe7afd4a7d6	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−6) × 8	−48	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
7a84939d-c339-4c1f-8165-f4a8ba1d16d4	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−2) × 11	−22	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
cmk37a6vd0087u2l7pagxcgkg	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a rectangle with length 16m and width 12m.	56 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vd0088u2l7rzbhalrq	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a square with side length 16m.	64 m	AREA	EASY	{square,perimeter}
cmk37a6vd0089u2l70ul7p5hx	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a square with side length 18m.	72 m	AREA	EASY	{square,perimeter}
cmk37a6vd008au2l7lb1c7yxb	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 22m and width 5m.	110 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd008bu2l79ke0elc2	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a rectangle with length 24m and width 6m.	144 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd008cu2l70il6yfyv	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 10cm and width 8cm. Find its area.	80 cm²	AREA	EASY	{rectangle,centimeters}
cmk37a6vd008du2l72k4002ex	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 12cm and width 5cm. Find its area.	60 cm²	AREA	EASY	{rectangle,centimeters}
cmk37a6vd008eu2l7h4axmy1r	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 7cm. Find its area.	49 cm²	AREA	EASY	{square,centimeters}
cmk37a6vd008fu2l7lj7aztlb	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 9cm. Find its area.	81 cm²	AREA	EASY	{square,centimeters}
cmk37a6vd008gu2l7rqcooicg	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 15cm and width 10cm. Find its perimeter.	50 cm	AREA	EASY	{rectangle,perimeter,centimeters}
cmk37a6vd008hu2l7v0op7msn	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 20cm and width 8cm. Find its perimeter.	56 cm	AREA	EASY	{rectangle,perimeter,centimeters}
cmk37a6vd008iu2l7du3l9e3m	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 10cm. Find its perimeter.	40 cm	AREA	EASY	{square,perimeter,centimeters}
cmk37a6vd008ju2l797kwej3e	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 12cm. Find its perimeter.	48 cm	AREA	EASY	{square,perimeter,centimeters}
cmk37a6vd008ku2l7qrhjzvy9	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 18cm and width 7cm. Find its area.	126 cm²	AREA	EASY	{rectangle,centimeters}
cmk37a6vd008lu2l78szhzzcx	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 16cm and width 9cm. Find its area.	144 cm²	AREA	EASY	{rectangle,centimeters}
cmk37a6vd008mu2l7sdsw5ybn	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 17m and width 6m. Find its area.	102 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd008nu2l73ziw2cb9	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 19m and width 4m. Find its area.	76 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd008ou2l7m4pzngnr	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 16m. Find its area.	256 m²	AREA	EASY	{square,basic}
cmk37a6vd008pu2l74w2ny7tt	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 17m. Find its area.	289 m²	AREA	EASY	{square,basic}
cmk37a6vd008qu2l7nxrawu9c	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 13m and width 10m. Find its perimeter.	46 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vd008ru2l7ju6fomqr	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 18m and width 9m. Find its perimeter.	54 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vd008su2l72l7ff980	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 19m. Find its perimeter.	76 m	AREA	EASY	{square,perimeter}
cmk37a6vd008tu2l7u2bo2r2i	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 21m. Find its perimeter.	84 m	AREA	EASY	{square,perimeter}
cmk37a6vd008uu2l736huxvxe	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 21m and width 8m. Find its area.	168 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd008vu2l79bv6knyv	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 23m and width 7m. Find its area.	161 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd008wu2l79j0ccrxz	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 14cm and width 11cm. Find its area.	154 cm²	AREA	EASY	{rectangle,centimeters}
cmk37a6vd008xu2l7yml26wnq	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 13cm and width 9cm. Find its area.	117 cm²	AREA	EASY	{rectangle,centimeters}
cmk37a6vd008yu2l7nx15356y	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 11cm. Find its area.	121 cm²	AREA	EASY	{square,centimeters}
cmk37a6vd008zu2l7w2o2ttrj	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 13cm. Find its area.	169 cm²	AREA	EASY	{square,centimeters}
cmk37a6vd0090u2l7tjui8aon	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 22cm and width 10cm. Find its perimeter.	64 cm	AREA	EASY	{rectangle,perimeter,centimeters}
cmk37a6vd0091u2l7zi86k1z8	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 24cm and width 12cm. Find its perimeter.	72 cm	AREA	EASY	{rectangle,perimeter,centimeters}
cmk37a6vd0092u2l7s22cgk0h	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 14cm. Find its perimeter.	56 cm	AREA	EASY	{square,perimeter,centimeters}
cmk37a6vd0093u2l7j39gh2b4	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 15cm. Find its perimeter.	60 cm	AREA	EASY	{square,perimeter,centimeters}
cmk37a6vd0094u2l797qtfybk	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 19cm and width 8cm. Find its area.	152 cm²	AREA	EASY	{rectangle,centimeters}
61d70112-df08-40d2-ae5b-781aff72816a	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−7) × 9	−63	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
78b26801-0b38-45ba-a1ba-172258d60389	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−1) × 12	−12	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
01426592-6cc9-40d0-93ae-216e7710fbe6	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−11) × 14	−154	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
cmk37a6vd0096u2l7tkjvx0w2	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 26m and width 5m. Find its area.	130 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd0097u2l7z8qhdjin	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 28m and width 4m. Find its area.	112 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd0098u2l7yttnvyj4	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 18m. Find its area.	324 m²	AREA	EASY	{square,basic}
cmk37a6vd0099u2l7bifyhlt2	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 19m. Find its area.	361 m²	AREA	EASY	{square,basic}
cmk37a6vd009au2l7vldyhwze	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 17m and width 11m. Find its perimeter.	56 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vd009bu2l77x37istn	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 19m and width 13m. Find its perimeter.	64 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vd009cu2l7o9ovg6i4	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 22m. Find its perimeter.	88 m	AREA	EASY	{square,perimeter}
cmk37a6vd009du2l7qira9zf3	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 24m. Find its perimeter.	96 m	AREA	EASY	{square,perimeter}
cmk37a6vd009eu2l7l0wye0iv	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 27m and width 6m. Find its area.	162 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd009fu2l7syow6az3	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 29m and width 5m. Find its area.	145 m²	AREA	EASY	{rectangle,basic}
cmk37a6vd009gu2l7rl58g5pc	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 23cm and width 9cm. Find its area.	207 cm²	AREA	EASY	{rectangle,centimeters}
cmk37a6vd009hu2l7pf13kvuf	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 25cm and width 7cm. Find its area.	175 cm²	AREA	EASY	{rectangle,centimeters}
cmk37a6vd009iu2l7dton050s	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 16cm. Find its area.	256 cm²	AREA	EASY	{square,centimeters}
cmk37a6vd009ju2l7cskwtobu	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 17cm. Find its area.	289 cm²	AREA	EASY	{square,centimeters}
cmk37a6vd009ku2l708b7e2lz	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 26cm and width 11cm. Find its perimeter.	74 cm	AREA	EASY	{rectangle,perimeter,centimeters}
cmk37a6vd009lu2l7d1hhxgmo	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 28cm and width 13cm. Find its perimeter.	82 cm	AREA	EASY	{rectangle,perimeter,centimeters}
cmk37a6vd009mu2l77za3390p	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 18cm. Find its perimeter.	72 cm	AREA	EASY	{square,perimeter,centimeters}
cmk37a6vd009nu2l7vgx66tab	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has side length 19cm. Find its perimeter.	76 cm	AREA	EASY	{square,perimeter,centimeters}
cmk37a6vd009ou2l71dcybffw	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 27cm and width 8cm. Find its area.	216 cm²	AREA	EASY	{rectangle,centimeters}
cmk37a6vd009pu2l7usat58t2	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 29cm and width 6cm. Find its area.	174 cm²	AREA	EASY	{rectangle,centimeters}
cmk37a6vd009qu2l71ewbg4od	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 10m and height 6m.	30 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd009ru2l7jjj8omka	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 12m and height 8m.	48 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd009su2l7kvz8nh0d	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 14m and height 5m.	35 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd009tu2l7i60s119o	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 16m and height 7m.	56 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd009uu2l7vr7ma8bm	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 5m. Use π = 3.14.	78.5 m²	AREA	MEDIUM	{circle,pi-given}
cmk37a6vd009vu2l7qsb4tlxd	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 7m. Use π = 3.14.	153.86 m²	AREA	MEDIUM	{circle,pi-given}
cmk37a6vd009wu2l71k310100	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with radius 4m. Use π = 3.14.	25.12 m	AREA	MEDIUM	{circle,circumference,pi-given}
cmk37a6vd009xu2l77bmhmooq	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with radius 6m. Use π = 3.14.	37.68 m	AREA	MEDIUM	{circle,circumference,pi-given}
cmk37a6vd009yu2l7rftxdq40	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 18m and height 10m.	90 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd009zu2l7k2qadeg2	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 20m and height 9m.	90 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00a0u2l7f0upw0us	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 15m and height 12m.	90 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00a1u2l7kqqe6j77	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 22m and height 6m.	66 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00a2u2l7hu4mdn8k	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 10m. Use π = 3.14.	314 m²	AREA	MEDIUM	{circle,pi-given}
cmk37a6vd00a3u2l7ifysc2ta	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 8m. Use π = 3.14.	200.96 m²	AREA	MEDIUM	{circle,pi-given}
cmk37a6vd00a4u2l70hl2zcb3	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with radius 9m. Use π = 3.14.	56.52 m	AREA	MEDIUM	{circle,circumference,pi-given}
d2072ee4-ab07-4e95-b466-feaf93e8b84b	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−8) × 15	−120	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
ef332f6e-6c5e-45f3-a27e-2eda937e60f8	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−4) × 5	−20	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
19437fb4-50fb-49cc-99b7-7723dc11d8a8	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−12) × 7	−84	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
cmk37a6vd00a6u2l7oqoz742p	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 24m and height 11m.	132 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00a7u2l7lrtacel7	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 26m and height 8m.	104 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00a8u2l70o40mbwo	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (8m × 5m) joined to a rectangle (4m × 3m).	52 m²	AREA	MEDIUM	{composite,rectangles}
cmk37a6vd00a9u2l753x0t6nx	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (10m × 6m) joined to a rectangle (5m × 4m).	80 m²	AREA	MEDIUM	{composite,rectangles}
cmk37a6vd00aau2l7zonc2axp	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 28m and height 7m.	98 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00abu2l7mtet3cx9	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 30m and height 10m.	150 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00acu2l7d71yx10o	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 12m. Use π = 3.14.	452.16 m²	AREA	MEDIUM	{circle,pi-given}
cmk37a6vd00adu2l7c9ooe37t	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 3m. Use π = 3.14.	28.26 m²	AREA	MEDIUM	{circle,pi-given}
cmk37a6vd00aeu2l7mb2hvo0e	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with radius 15m. Use π = 3.14.	94.2 m	AREA	MEDIUM	{circle,circumference,pi-given}
cmk37a6vd00afu2l7xw5hyuzb	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with radius 20m. Use π = 3.14.	125.6 m	AREA	MEDIUM	{circle,circumference,pi-given}
cmk37a6vd00agu2l79r01oy9y	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 32m and height 9m.	144 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00ahu2l7tf179xuc	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 25m and height 14m.	175 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00aiu2l7qzs0bqa1	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (12m × 7m) joined to a rectangle (6m × 5m).	114 m²	AREA	MEDIUM	{composite,rectangles}
cmk37a6vd00aju2l7donxq222	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (15m × 8m) joined to a rectangle (7m × 6m).	162 m²	AREA	MEDIUM	{composite,rectangles}
cmk37a6vd00aku2l7sbc9929y	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 34m and height 12m.	204 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00alu2l7ihaf4t90	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 36m and height 11m.	198 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00amu2l7khm8jnp9	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 14m. Use π = 3.14.	615.44 m²	AREA	MEDIUM	{circle,pi-given}
cmk37a6vd00anu2l7rv967tez	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 9m. Use π = 3.14.	254.34 m²	AREA	MEDIUM	{circle,pi-given}
cmk37a6vd00aou2l75sivd2ek	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with diameter 10m. Use π = 3.14.	31.4 m	AREA	MEDIUM	{circle,circumference,diameter,pi-given}
cmk37a6vd00apu2l7jxct84jr	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with diameter 14m. Use π = 3.14.	43.96 m	AREA	MEDIUM	{circle,circumference,diameter,pi-given}
cmk37a6vd00aqu2l7152iq8ev	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 38m and height 13m.	247 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00aru2l75a0e0e7k	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 40m and height 15m.	300 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00asu2l7x53msp9p	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (18m × 9m) joined to a rectangle (8m × 7m).	218 m²	AREA	MEDIUM	{composite,rectangles}
cmk37a6vd00atu2l7k9nbz05y	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (20m × 10m) joined to a rectangle (10m × 8m).	280 m²	AREA	MEDIUM	{composite,rectangles}
cmk37a6vd00auu2l7fkluq5j3	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 11cm and height 8cm.	44 cm²	AREA	MEDIUM	{triangle,centimeters}
cmk37a6vd00avu2l7wgi6hhlw	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 13cm and height 10cm.	65 cm²	AREA	MEDIUM	{triangle,centimeters}
cmk37a6vd00awu2l70owwcsja	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 4cm. Use π = 3.14.	50.24 cm²	AREA	MEDIUM	{circle,pi-given,centimeters}
cmk37a6vd00axu2l7869k80qr	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 6cm. Use π = 3.14.	113.04 cm²	AREA	MEDIUM	{circle,pi-given,centimeters}
cmk37a6vd00ayu2l7e7vk0shy	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with radius 5cm. Use π = 3.14.	31.4 cm	AREA	MEDIUM	{circle,circumference,pi-given,centimeters}
cmk37a6vd00azu2l7iaiixuou	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with radius 7cm. Use π = 3.14.	43.96 cm	AREA	MEDIUM	{circle,circumference,pi-given,centimeters}
cmk37a6vd00b0u2l7ogds5pbq	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 17cm and height 12cm.	102 cm²	AREA	MEDIUM	{triangle,centimeters}
cmk37a6vd00b1u2l7ficw7ox9	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 19cm and height 14cm.	133 cm²	AREA	MEDIUM	{triangle,centimeters}
cmk37a6ve00byu2l7j35zpxhx	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has area 120m² and length 15m. Find its width.	8 m	AREA	HARD	{reverse-problem,rectangle}
d9d4bd1a-680e-4f8e-a90b-f8b5df07ebc6	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	4 × (−3)	−12	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
d0a7b550-d307-4f86-b414-18422e2eea0b	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−3) × 5	−15	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
b1635ce5-2e99-49e5-b952-035d4d8fb8b2	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	8 × (−6)	−48	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
cmk37a6vd00b3u2l7zfg4184q	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (13cm × 7cm) joined to a rectangle (6cm × 5cm).	121 cm²	AREA	MEDIUM	{composite,rectangles,centimeters}
cmk37a6vd00b4u2l73baoncji	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 21cm and height 16cm.	168 cm²	AREA	MEDIUM	{triangle,centimeters}
cmk37a6vd00b5u2l7wmi8j4x1	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 23cm and height 18cm.	207 cm²	AREA	MEDIUM	{triangle,centimeters}
cmk37a6vd00b6u2l73x6ipinf	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 8cm. Use π = 3.14.	200.96 cm²	AREA	MEDIUM	{circle,pi-given,centimeters}
cmk37a6vd00b7u2l7hugftcm9	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 10cm. Use π = 3.14.	314 cm²	AREA	MEDIUM	{circle,pi-given,centimeters}
cmk37a6vd00b8u2l7z4gdb410	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with diameter 12cm. Use π = 3.14.	37.68 cm	AREA	MEDIUM	{circle,circumference,diameter,pi-given,centimeters}
cmk37a6vd00b9u2l7poo8lbzp	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with diameter 16cm. Use π = 3.14.	50.24 cm	AREA	MEDIUM	{circle,circumference,diameter,pi-given,centimeters}
cmk37a6vd00bau2l7i7qfxvdp	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 27cm and height 20cm.	270 cm²	AREA	MEDIUM	{triangle,centimeters}
cmk37a6vd00bbu2l7d91ku63k	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 29cm and height 22cm.	319 cm²	AREA	MEDIUM	{triangle,centimeters}
cmk37a6vd00bcu2l72siw125u	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (16cm × 9cm) joined to a rectangle (8cm × 6cm).	192 cm²	AREA	MEDIUM	{composite,rectangles,centimeters}
cmk37a6vd00bdu2l7j6xyo960	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (19cm × 10cm) joined to a rectangle (9cm × 7cm).	253 cm²	AREA	MEDIUM	{composite,rectangles,centimeters}
cmk37a6vd00beu2l79xuhhic7	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 42m and height 16m.	336 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00bfu2l7h13jjbnd	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 44m and height 18m.	396 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6vd00bgu2l7uavgchff	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 16m. Use π = 3.14.	803.84 m²	AREA	MEDIUM	{circle,pi-given}
cmk37a6ve00bhu2l7g2mh07fw	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 18m. Use π = 3.14.	1017.36 m²	AREA	MEDIUM	{circle,pi-given}
cmk37a6ve00biu2l7lmjpwcpw	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with diameter 20m. Use π = 3.14.	62.8 m	AREA	MEDIUM	{circle,circumference,diameter,pi-given}
cmk37a6ve00bju2l71hub1u5l	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with diameter 24m. Use π = 3.14.	75.36 m	AREA	MEDIUM	{circle,circumference,diameter,pi-given}
cmk37a6ve00bku2l768t3r3wa	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 46m and height 17m.	391 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6ve00blu2l7dsku3xkv	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 48m and height 19m.	456 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6ve00bmu2l7wdc7vwo0	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (22m × 11m) joined to a rectangle (11m × 9m).	341 m²	AREA	MEDIUM	{composite,rectangles}
cmk37a6ve00bnu2l7yfbbsymz	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (25m × 12m) joined to a rectangle (12m × 10m).	420 m²	AREA	MEDIUM	{composite,rectangles}
cmk37a6ve00bou2l7fqetetxj	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (14m × 8m) joined to a square (6m × 6m).	148 m²	AREA	MEDIUM	{composite,mixed}
cmk37a6ve00bpu2l774bius64	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (16m × 10m) joined to a square (8m × 8m).	224 m²	AREA	MEDIUM	{composite,mixed}
cmk37a6ve00bqu2l79bzm1eg4	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (18m × 12m) joined to a square (10m × 10m).	316 m²	AREA	MEDIUM	{composite,mixed}
cmk37a6ve00bru2l7axdbcpgk	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (20m × 14m) joined to a square (12m × 12m).	424 m²	AREA	MEDIUM	{composite,mixed}
cmk37a6ve00bsu2l7kuxushvm	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangular garden is 12m long and 8m wide. Find the area.	96 m²	AREA	HARD	{word-problem,rectangle}
cmk37a6ve00btu2l758qwq6hg	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square room has sides of length 7m. How much carpet is needed to cover the floor?	49 m²	AREA	HARD	{word-problem,square}
cmk37a6ve00buu2l7cql4f3y9	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A painting is 50cm wide and 70cm tall. What is its area in cm²?	3500 cm²	AREA	HARD	{word-problem,rectangle,centimeters}
cmk37a6ve00bvu2l7pwdnzm3z	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A circular pond has a radius of 6m. Find its area using π = 3.14.	113.04 m²	AREA	HARD	{word-problem,circle,pi-given}
cmk37a6ve00bwu2l7qq28sdra	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A field is 80m long and 50m wide. What is its area in m²?	4000 m²	AREA	HARD	{word-problem,rectangle,large-numbers}
cmk37a6ve00bxu2l7wkvfxlnp	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A triangular sail has a base of 8m and height of 12m. Find its area.	48 m²	AREA	HARD	{word-problem,triangle}
a2d69927-3a6a-4976-a181-03a92fdad0bc	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−6) × 9	−54	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
54933eb2-8508-4af4-9a49-847a77ad474e	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	12 × (−12)	−144	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
b962b004-ca64-45d2-85d9-75515f84b459	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−9) × 7	−63	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
cmk37a6ve00c0u2l7c5baly6t	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has perimeter 40m and width 8m. Find its length.	12 m	AREA	HARD	{reverse-problem,perimeter,rectangle}
cmk37a6ve00c1u2l7k6nmosop	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A circle has area 78.5m². Find its radius. Use π = 3.14.	5 m	AREA	HARD	{reverse-problem,circle,pi-given}
cmk37a6ve00c2u2l7hr2nm7qq	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangular pool is 25m long and 15m wide. Find the area.	375 m²	AREA	HARD	{word-problem,rectangle}
cmk37a6ve00c3u2l7ard79kvh	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square courtyard has sides of 9m. How much paving is needed?	81 m²	AREA	HARD	{word-problem,square}
cmk37a6ve00c4u2l72abj38x8	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A wall is 6m high and 20m long. What is its area?	120 m²	AREA	HARD	{word-problem,rectangle}
cmk37a6ve00c5u2l7qmnux4sx	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A circular flower bed has radius 4m. Find its area using π = 3.14.	50.24 m²	AREA	HARD	{word-problem,circle,pi-given}
cmk37a6ve00c6u2l7637ul7bb	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A triangular flag has base 6m and height 10m. Find its area.	30 m²	AREA	HARD	{word-problem,triangle}
cmk37a6ve00c7u2l7q2k0m0p8	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has area 180m² and width 12m. Find its length.	15 m	AREA	HARD	{reverse-problem,rectangle}
cmk37a6ve00c8u2l77zwiyclh	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has area 225m². Find the length of its sides.	15 m	AREA	HARD	{reverse-problem,square}
cmk37a6ve00c9u2l79qh4qb4h	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has perimeter 50m and length 18m. Find its width.	7 m	AREA	HARD	{reverse-problem,perimeter,rectangle}
cmk37a6ve00cau2l7j6uadcd8	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A circle has area 153.86m². Find its radius. Use π = 3.14.	7 m	AREA	HARD	{reverse-problem,circle,pi-given}
cmk37a6ve00cbu2l7j1retqfr	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A park is 100m long and 60m wide. What is its area in m²?	6000 m²	AREA	HARD	{word-problem,rectangle,large-numbers}
cmk37a6ve00ccu2l7rbet8gjf	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangular driveway is 18m long and 4m wide. Find the area.	72 m²	AREA	HARD	{word-problem,rectangle}
cmk37a6ve00cdu2l7frzcthvm	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square tile has sides of 30cm. Find its area in cm².	900 cm²	AREA	HARD	{word-problem,square,centimeters}
cmk37a6ve00ceu2l7zspxswj0	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A door is 2m tall and 90cm wide. What is its area in cm²?	18000 cm²	AREA	HARD	{word-problem,rectangle,unit-conversion}
cmk37a6ve00cfu2l7ql78cz75	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A circular trampoline has diameter 5m. Find its area using π = 3.14.	19.625 m²	AREA	HARD	{word-problem,circle,diameter,pi-given}
cmk37a6ve00cgu2l79rr8wbdy	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A triangular garden bed has base 14m and height 8m. Find its area.	56 m²	AREA	HARD	{word-problem,triangle}
cmk37a6ve00chu2l7f04hwctz	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has area 210m² and length 14m. Find its width.	15 m	AREA	HARD	{reverse-problem,rectangle}
cmk37a6ve00ciu2l71uv8beb8	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has area 196m². Find the length of its sides.	14 m	AREA	HARD	{reverse-problem,square}
cmk37a6ve00cju2l7mijl5eep	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has perimeter 60m and width 10m. Find its length.	20 m	AREA	HARD	{reverse-problem,perimeter,rectangle}
cmk37a6ve00cku2l7rgke155h	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A circle has area 200.96m². Find its radius. Use π = 3.14.	8 m	AREA	HARD	{reverse-problem,circle,pi-given}
cmk37a6ve00clu2l7y1ht4zjr	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A tennis court is 23.77m long and 10.97m wide. Approximately what is its area?	261 m²	AREA	HARD	{word-problem,rectangle,decimal}
cmk37a6ve00cmu2l7azovfnga	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangular classroom is 8m long and 6m wide. Find the area.	48 m²	AREA	HARD	{word-problem,rectangle}
cmk37a6ve00cnu2l7l6xz9kl4	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square playground has sides of 20m. Find its area.	400 m²	AREA	HARD	{word-problem,square}
cmk37a6ve00cou2l7g1tm02ko	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A window is 150cm tall and 120cm wide. Find its area in cm².	18000 cm²	AREA	HARD	{word-problem,rectangle,centimeters}
cmk37a6ve00cpu2l789b8gebg	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A circular pizza has radius 18cm. Find its area using π = 3.14.	1017.36 cm²	AREA	HARD	{word-problem,circle,pi-given,centimeters}
cmk37a6ve00cqu2l785m5t8lc	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A triangular roof section has base 10m and height 7m. Find its area.	35 m²	AREA	HARD	{word-problem,triangle}
cmk37a6ve00cru2l7gakidg8o	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has area 240m² and width 16m. Find its length.	15 m	AREA	HARD	{reverse-problem,rectangle}
cmk37a6ve00csu2l77o8hpoyi	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has area 289m². Find the length of its sides.	17 m	AREA	HARD	{reverse-problem,square}
cmk37a6ve00ctu2l7jqaedcyf	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has perimeter 70m and length 25m. Find its width.	10 m	AREA	HARD	{reverse-problem,perimeter,rectangle}
cmk37a6ve00cuu2l75odwk5y1	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A circle has area 314m². Find its radius. Use π = 3.14.	10 m	AREA	HARD	{reverse-problem,circle,pi-given}
cmk37a6ve00cvu2l7n7ybnpcl	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A basketball court is 28m long and 15m wide. Find its area.	420 m²	AREA	HARD	{word-problem,rectangle}
cmk37a6ve00cwu2l7vfngx64k	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 50m and height 21m.	525 m²	AREA	MEDIUM	{triangle,basic}
04807baa-884f-4974-a202-feeadb6e6876	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	18 × (−4)	−72	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
eaa13c21-ca88-4dd4-a752-f10137b0a4af	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−15) × 5	−75	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
cmk37a6ve00dcu2l7ptt02la6	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (32m × 18m) joined to a rectangle (18m × 16m).	864 m²	AREA	MEDIUM	{composite,rectangles,set-11}
cmk37a6ve00ddu2l71tccc0yk	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (35m × 20m) joined to a rectangle (20m × 18m).	1060 m²	AREA	MEDIUM	{composite,rectangles,set-11}
cmk37a6ve00deu2l7nd92r7fl	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (28m × 20m) joined to a square (18m × 18m).	884 m²	AREA	MEDIUM	{composite,mixed,set-11}
cmk37a6ve00dfu2l7esxnrf3w	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (30m × 22m) joined to a square (20m × 20m).	1060 m²	AREA	MEDIUM	{composite,mixed,set-11}
cmk37a6ve00dgu2l7dkpa4d5v	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 58m and height 29m.	841 m²	AREA	MEDIUM	{triangle,basic,set-11}
cmk37a6ve00dhu2l7ojji86zt	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 60m and height 31m.	930 m²	AREA	MEDIUM	{triangle,basic,set-11}
cmk37a6ve00diu2l7pi33ghpo	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 19m. Use π = 3.14.	1133.54 m²	AREA	MEDIUM	{circle,radius,pi-given,set-11}
cmk37a6ve00dju2l7mtrpy70n	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 20m. Use π = 3.14.	1256 m²	AREA	MEDIUM	{circle,radius,pi-given,set-11}
cmk37a6ve00dku2l740rr2v1i	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with radius 21m. Use π = 3.14.	131.88 m	AREA	MEDIUM	{circle,circumference,radius,pi-given,set-12}
cmk37a6ve00dlu2l7b2wjoh3y	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with diameter 44m. Use π = 3.14.	138.16 m	AREA	MEDIUM	{circle,circumference,diameter,pi-given,set-12}
cmk37a6ve00cyu2l748k8qfpk	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 13m. Use π = 3.14.	530.66 m²	AREA	MEDIUM	{circle,radius,pi-given}
cmk37a6ve00czu2l77s6pndph	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 14m. Use π = 3.14.	615.44 m²	AREA	MEDIUM	{circle,radius,pi-given}
cmk37a6ve00d0u2l72e09pe4a	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with radius 15m. Use π = 3.14.	94.2 m	AREA	MEDIUM	{circle,circumference,radius,pi-given}
cmk37a6ve00d1u2l73c8r6c06	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with diameter 32m. Use π = 3.14.	100.48 m	AREA	MEDIUM	{circle,circumference,diameter,pi-given}
cmk37a6ve00d2u2l7f3n4dudt	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (28m × 14m) joined to a rectangle (14m × 12m).	560 m²	AREA	MEDIUM	{composite,rectangles}
cmk37a6ve00d3u2l78i6ik8ye	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (30m × 16m) joined to a rectangle (16m × 14m).	704 m²	AREA	MEDIUM	{composite,rectangles}
cmk37a6ve00d4u2l7en96ujn3	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (24m × 15m) joined to a square (14m × 14m).	556 m²	AREA	MEDIUM	{composite,mixed}
cmk37a6ve00d5u2l7tr3s7vnj	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (26m × 18m) joined to a square (16m × 16m).	724 m²	AREA	MEDIUM	{composite,mixed}
cmk37a6ve00d6u2l7dckdau7j	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 54m and height 25m.	675 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6ve00d7u2l7lxzhv4x6	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 56m and height 27m.	756 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6ve00d8u2l77dsymsbq	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 16m. Use π = 3.14.	803.84 m²	AREA	MEDIUM	{circle,radius,pi-given}
cmk37a6ve00d9u2l7ff54wnjl	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a circle with radius 17m. Use π = 3.14.	907.46 m²	AREA	MEDIUM	{circle,radius,pi-given}
cmk37a6ve00dau2l76txv53kw	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with radius 18m. Use π = 3.14.	113.04 m	AREA	MEDIUM	{circle,circumference,radius,pi-given}
cmk37a6ve00dbu2l72rk14l7v	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with diameter 38m. Use π = 3.14.	119.32 m	AREA	MEDIUM	{circle,circumference,diameter,pi-given}
cmk37a6ve00dmu2l712r6ka4r	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangular field is 45m long and 30m wide. Find the area.	1350 m²	AREA	HARD	{word-problem,rectangle}
cmk37a6ve00dnu2l7dovjaegd	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square playground has sides of 20m. Find the area.	400 m²	AREA	HARD	{word-problem,square}
cmk37a6ve00dou2l7umy6oks3	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A triangular roof has base 16m and height 9m. Find its area.	72 m²	AREA	HARD	{word-problem,triangle}
cmk37a6ve00dpu2l7o9tzk222	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A circular fountain has diameter 8m. Find its area using π = 3.14.	50.24 m²	AREA	HARD	{word-problem,circle,diameter,pi-given}
cmk37a6ve00dqu2l7xpuhxfri	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has area 350m² and width 14m. Find its length.	25 m	AREA	HARD	{reverse-problem,rectangle}
cmk37a6ve00dru2l76dt10gf1	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has area 400m². Find the length of its sides.	20 m	AREA	HARD	{reverse-problem,square}
cmk37a6ve00dsu2l7rndulg4u	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has perimeter 80m and width 15m. Find its length.	25 m	AREA	HARD	{reverse-problem,perimeter,rectangle}
cmk37a6ve00dtu2l75h14dunx	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A circle has area 452.16m². Find its radius. Use π = 3.14.	12 m	AREA	HARD	{reverse-problem,circle,pi-given}
58133f44-78d6-49c0-b96f-3fbaa032ec4e	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	16 × (−9)	−144	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
eb79c4f6-ec9a-4d2b-b6e8-2cc64297051e	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	2 × 8	16	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
c7eaa07d-64ab-488e-b8f6-c25a6d6e3c6c	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	5 × 7	35	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
cmk37a6ve00dvu2l7iyvzn2vo	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangular parking lot is 50m long and 35m wide. Find the area.	1750 m²	AREA	HARD	{word-problem,rectangle,large-numbers}
cmk37a6vx00dwu2l7urck8iam	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates of the point at x = 2 and y = 3?	(2, 3)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vx00dxu2l75plfc1lh	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot the point (5, 1). What is its x-coordinate?	5	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,x-coordinate}
cmk37a6vx00dyu2l7zvj2ljse	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot the point (3, 7). What is its y-coordinate?	7	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,y-coordinate}
cmk37a6vx00dzu2l7vfr2u1ee	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is located at (4, 6). Which quadrant is it in?	Quadrant 1	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,quadrants}
cmk37a6vx00e0u2l7bkcwuwap	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates of the origin?	(0, 0)	COORDINATES_PLOTTING	EASY	{origin,basic}
cmk37a6vx00e1u2l7p53rg3w7	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot the point (1, 1). How far is it from the origin along the x-axis?	1 unit	COORDINATES_PLOTTING	EASY	{quadrant-1,distance,basic}
cmk37a6vx00e2u2l7kdkbu017	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has coordinates (6, 2). What is x + y?	8	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vx00e3u2l7uollrtrd	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point A is at (3, 5). What is 2 times its x-coordinate?	6	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vx00e4u2l71lwpjtey	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the x-coordinate of a point on the y-axis?	0	COORDINATES_PLOTTING	EASY	{axes,basic}
cmk37a6vx00e5u2l7ltg1yyms	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the y-coordinate of a point on the x-axis?	0	COORDINATES_PLOTTING	EASY	{axes,basic}
cmk37a6vx00e6u2l7ae206vvo	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (7, 3). Is this point above or below y = 5?	Below	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vx00e7u2l720o6h7dg	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point B is at (2, 8). Is this point left or right of x = 5?	Left	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vx00e8u2l7zbd6298x	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates of the point at x = 8 and y = 4?	(8, 4)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vx00e9u2l737y72r7q	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (9, 1). What is the sum of its coordinates?	10	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vx00eau2l7zw125hbm	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (5, 5). What is the difference y - x?	0	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vx00ebu2l7wcjxg5xl	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point C has x = 1 and y = 9. Write its coordinates.	(1, 9)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vx00ecu2l72r1r448j	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What quadrant contains the point (10, 2)?	Quadrant 1	COORDINATES_PLOTTING	EASY	{quadrant-1,quadrants}
cmk37a6vx00edu2l7h2c0u01d	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (4, 4). What is x - y?	0	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vx00eeu2l7t2xdrguy	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (6, 7). What is its x-coordinate doubled?	12	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vx00efu2l71ef0wzk9	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point D is at (2, 2). What is the product of its coordinates?	4	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vx00egu2l74mom71kg	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates of the point at x = 3 and y = 1?	(3, 1)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vx00ehu2l7ts245rv0	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (7, 8). Is its y-coordinate greater than its x-coordinate?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vx00eiu2l7thsd9k0g	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point E is at (9, 3). What is 3 times its y-coordinate?	9	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vx00eju2l7yytyw419	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has coordinates (5, 10). What is y - x?	5	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vx00eku2l7bltdh3wg	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (10, 10). What is the sum of its coordinates?	20	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00elu2l7rtkpbdj3	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What quadrant contains a point with positive x and positive y?	Quadrant 1	COORDINATES_PLOTTING	EASY	{quadrants,rules}
cmk37a6vy00emu2l7h9e00600	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point F is at (1, 5). Is it above the point (1, 3)?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vy00enu2l78fkq4k2y	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 6 and y = 9?	(6, 9)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00eou2l7afa9ok6i	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (8, 7). What is the product of its coordinates?	56	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00epu2l7mp3swpng	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (4, 1). What is x + y + 5?	10	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00equ2l75ip9kxpl	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point G has coordinates (7, 7). What is x - y?	0	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00eru2l7zpgc2lez	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (2, 6). Is this point to the right of x = 1?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vy00esu2l7yl5sg93s	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 9 and y = 2?	(9, 2)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00etu2l7aqbfa4ug	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (3, 4). What is 2x?	6	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
9a73174d-cfbf-41ab-9771-6789434290b5	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	10 × 10	100	INTEGERS_MULTIPLICATION	EASY	{positive-times-positive}
85c032c1-3d10-4616-8474-5a2e6d8bc9c8	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−4) × 9	−36	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
b7632d9e-7c10-48a8-b077-5cee46100fba	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	6 × (−7)	−42	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
cmk37a6vy00evu2l7x1h273fs	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (10, 5). Is its x-coordinate greater than its y-coordinate?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vy00ewu2l7oaj6mimk	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 1 and y = 2?	(1, 2)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00exu2l7es0ua6uh	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 8 and y = 8. What is x + y?	16	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00eyu2l7u5e2lj6y	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point I is at (4, 9). What is the difference between its coordinates?	5	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00ezu2l72q0o089t	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (6, 3). What is x divided by 2?	3	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00f0u2l7lr07xg2f	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 2 and y = 5?	(2, 5)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00f1u2l7mkvwgvzl	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point J is at (7, 4). What is xy (product)?	28	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00f2u2l7orbogv9t	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (3, 8). Is it above y = 5?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vy00f3u2l756zf63f0	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (9, 9). What is the sum of its coordinates?	18	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00f4u2l7l89j6fuu	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point K has coordinates (5, 2). What is 3x?	15	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00f5u2l7j7ywaapa	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 4 and y = 7?	(4, 7)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00f6u2l7s9i9sj2p	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (10, 1). What is y + 9?	10	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00f7u2l7zebvkl7y	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (1, 4). Is it to the left of x = 5?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vy00f8u2l7pyyv6kvy	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point L is at (8, 6). What is x + y?	14	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00f9u2l7qanry4qz	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 7 and y = 10?	(7, 10)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00fau2l71cdpa6jj	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has coordinates (6, 5). What is x - y?	1	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00fbu2l724x44s5k	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (2, 9). What is 2y?	18	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00fcu2l7qqy4lppp	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point M is at (5, 8). Is its y-coordinate greater than 7?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vy00fdu2l7w46gpjam	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 9 and y = 5?	(9, 5)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00feu2l7o5c3wyg8	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (3, 6). What is the product of its coordinates?	18	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00ffu2l7qrb7kql5	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (10, 8). What is x - y?	2	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00fgu2l7u16fzqo6	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point N has x = 4 and y = 3. What is 2x + y?	11	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00fhu2l7mqruhaiw	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 1 and y = 7?	(1, 7)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00fiu2l7r62wn3ff	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (8, 2). What is 3y?	6	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00fju2l7ngwu88b1	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (6, 10). Is it above y = 8?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vy00fku2l7kqq0fh19	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point P has coordinates (9, 7). What is x + y?	16	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00flu2l7vfiyknho	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 3 and y = 2?	(3, 2)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00fmu2l7l731835b	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (7, 1). What is x - y?	6	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00fnu2l712f592na	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (2, 4). Is its y-coordinate even?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,properties}
cmk37a6vy00fou2l7pksoibxx	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point Q is at (5, 9). What is the product xy?	45	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00fpu2l763dpuajg	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 10 and y = 3?	(10, 3)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00fqu2l7k8rzpgm9	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 4 and y = 5. What is x + y + 1?	10	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00fru2l7ajklqyvr	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (8, 9). What is the difference y - x?	1	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00fsu2l7guudvmps	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point R is at (1, 6). What is 4y?	24	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00ftu2l703wge5cl	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 6 and y = 1?	(6, 1)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00fuu2l71xvzjko7	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (9, 4). Is it to the right of x = 5?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
68bdf175-cc45-485a-9448-25edb08c16aa	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−2) × 15	−30	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
1859393f-001f-494c-aa84-17a3353abfe7	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	20 × (−3)	−60	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
a7eddb19-ff98-4b6b-93e7-239b814aa74e	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−5) × 8	−40	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
cmk37a6vy00fwu2l7er0rgqk7	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point S has coordinates (7, 6). What is x + y?	13	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00fxu2l7z595314s	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 2 and y = 7?	(2, 7)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00fyu2l7lazk7un8	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (5, 3). What is the product of its coordinates?	15	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00fzu2l7wjlyjj0x	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (10, 7). What is x - y?	3	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00g0u2l7bavwhwsb	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point T is at (4, 8). Is its y-coordinate greater than its x-coordinate?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vy00g1u2l7cq8bquo1	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 8 and y = 1?	(8, 1)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00g2u2l730irgvms	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 1 and y = 8. What is 3y?	24	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00g3u2l71y1c7uub	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (6, 4). What is x + y?	10	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00g4u2l7r0vlawb5	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point U has coordinates (9, 6). What is y - x?	-3	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00g5u2l7bmnrqv0d	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 3 and y = 9?	(3, 9)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00g6u2l79coshubf	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (7, 2). What is 4x?	28	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00g7u2l7f56yh58m	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (2, 1). Is it below y = 5?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vy00g8u2l7mldfu2aj	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point V is at (10, 4). What is the sum of its coordinates?	14	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00g9u2l7rr34wa7s	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 5 and y = 7?	(5, 7)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00gau2l708hptmu8	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 8 and y = 3. What is xy?	24	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00gbu2l72rr3kscq	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (1, 10). What is 5y?	50	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00gcu2l7m2cotrsx	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point W is at (4, 2). What is x + y?	6	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00gdu2l73ipj221d	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 9 and y = 8?	(9, 8)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00geu2l72hhk7xbg	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (6, 6). What is x - y?	0	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00gfu2l7r6nd12te	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (3, 5). Is its x-coordinate odd?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,properties}
cmk37a6vy00ggu2l7pzk8cav5	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point X is at (10, 9). What is x + y?	19	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00ghu2l73yb0j1vd	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 2 and y = 10?	(2, 10)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00giu2l7pjkg6cxl	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 7 and y = 5. What is 2x + y?	19	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00gju2l7824b77g8	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (5, 4). What is the product of its coordinates?	20	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00gku2l7ic9tvkza	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point Y is at (8, 10). Is it above y = 7?	Yes	COORDINATES_PLOTTING	EASY	{quadrant-1,comparison}
cmk37a6vy00glu2l7gy0cqeoe	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 4 and y = 10?	(4, 10)	COORDINATES_PLOTTING	EASY	{quadrant-1,positive-integers,basic}
cmk37a6vy00gmu2l7zqcuyk8v	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (9, 10). What is x + y?	19	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00gnu2l7b4s4nxsq	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (7, 9). What is the difference y - x?	2	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00gou2l750nmr3zg	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates of the point at x = -3 and y = 4?	(-3, 4)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vy00gpu2l7r98n4oqu	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Which quadrant contains the point (-5, 2)?	Quadrant 2	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,quadrants}
cmk37a6vy00gqu2l708ikw0qv	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates of the point at x = 6 and y = -3?	(6, -3)	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,negative-integers,basic}
cmk37a6vy00gru2l7l2plx92g	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Which quadrant contains the point (4, -7)?	Quadrant 4	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,quadrants}
cmk37a6vy00gsu2l7nxi2b46x	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates of the point at x = -2 and y = -5?	(-2, -5)	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,negative-integers,basic}
cmk37a6vy00gtu2l7vz1hvqr4	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Which quadrant contains the point (-6, -3)?	Quadrant 3	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,quadrants}
cmk37a6vy00guu2l72rt10pio	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point A is at (-4, 7). What is its x-coordinate?	-4	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,coordinates}
cmk37a6vy00gvu2l7qwg16wdu	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point B is at (8, -6). What is its y-coordinate?	-6	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,coordinates}
c06584c2-6915-4330-8858-e0843097ab0c	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	9 × (−9)	−81	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
30e316bc-3dad-4a30-8b1d-12245690b15a	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−7) × 7	−49	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
cmk37a6vy00gxu2l7m457pkra	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -7 and y = 1?	(-7, 1)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vy00gyu2l7wun17e4j	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point C is at (3, -9). What is x + y?	-6	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vy00gzu2l7bcqnwnre	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has coordinates (-1, -4). What is the sum of its coordinates?	-5	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vy00h0u2l7vmbmii60	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What quadrant has negative x and positive y coordinates?	Quadrant 2	COORDINATES_PLOTTING	MEDIUM	{quadrants,rules}
cmk37a6vy00h1u2l7vzzz3pgt	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What quadrant has positive x and negative y coordinates?	Quadrant 4	COORDINATES_PLOTTING	MEDIUM	{quadrants,rules}
cmk37a6vy00h2u2l74uoiig3r	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What quadrant has both negative coordinates?	Quadrant 3	COORDINATES_PLOTTING	MEDIUM	{quadrants,rules}
cmk37a6vy00h3u2l7vpgw32m2	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point D is at (-6, 5). What is 2x?	-12	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,arithmetic}
cmk37a6vy00h4u2l7d9dp6x7x	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (7, -4). What is 3y?	-12	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vy00h5u2l77pcb4vtc	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -8 and y = -2?	(-8, -2)	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,negative-integers,basic}
cmk37a6vy00h6u2l7rir3f33k	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point E is at (-3, -7). What is x + y?	-10	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vy00h7u2l7sw9qjh66	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 9 and y = -5. What is x - y?	14	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vy00h8u2l7vilc2g76	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -4 and y = 8?	(-4, 8)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vy00h9u2l7vb2kr35a	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point F is at (5, -10). Which quadrant is it in?	Quadrant 4	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,quadrants}
cmk37a6vy00hau2l7u8mw5i2m	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (-9, -1). What is the product of its coordinates?	9	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vy00hbu2l76uzuzchp	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 10 and y = -8?	(10, -8)	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,negative-integers,basic}
cmk37a6vy00hcu2l7xra7t415	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point G is at (-2, 6). What is x + y?	4	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,arithmetic}
cmk37a6vy00hdu2l79nqds6qw	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has coordinates (1, -3). What is 2x + y?	-1	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vy00heu2l7p6bgzs0p	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -10 and y = 7?	(-10, 7)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vy00hfu2l7fp2zrqhe	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point H is at (-7, -9). What is y - x?	-2	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vy00hgu2l7fmbxf5eg	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (8, -1). Is it above or below the x-axis?	Below	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,axes}
cmk37a6vy00hhu2l7rklkrcza	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -5 and y = -6?	(-5, -6)	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,negative-integers,basic}
cmk37a6vy00hiu2l76sjgq3xr	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point I is at (-1, 9). Is it left or right of the y-axis?	Left	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,axes}
cmk37a6vy00hju2l78j7p9sme	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 4 and y = -2. What is xy?	-8	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vy00hku2l7elc41ozm	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -9 and y = 3?	(-9, 3)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vy00hlu2l7l8xlowww	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point J is at (2, -7). What is x + y?	-5	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vy00hmu2l78g0s1nhu	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (-6, -10). What is 2x?	-12	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vy00hnu2l79hxe5qfi	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 7 and y = -9?	(7, -9)	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,negative-integers,basic}
cmk37a6vy00hou2l7vi3hptt2	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point K is at (-8, 4). What is the sum of its coordinates?	-4	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,arithmetic}
cmk37a6vy00hpu2l7pl89om0h	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = -3 and y = -2. What is x - y?	-1	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vy00hqu2l7wcnrebds	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 6 and y = -10?	(6, -10)	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,negative-integers,basic}
cmk37a6vy00hru2l7zauoww95	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point L is at (-10, -5). Which quadrant is it in?	Quadrant 3	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,quadrants}
cmk37a6vy00hsu2l7czdivzsz	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (9, -2). What is 2y?	-4	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vy00htu2l7j4aj5lej	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -1 and y = 10?	(-1, 10)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vy00huu2l7b3n9ftnq	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point M is at (-4, -8). What is x + y?	-12	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vy00hvu2l7jyc6vb0n	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 3 and y = -6. What is the product of its coordinates?	-18	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6wi00m5u2l7t5mo7nbs	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 7, 21, 35, 49	42	DATA_ANALYSIS	EASY	{range,basic}
222c83c4-3bda-4dcb-b026-9c3f5a8febd0	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	11 × (−8)	−88	INTEGERS_MULTIPLICATION	EASY	{positive-times-negative}
95789d9d-2673-44e7-ab97-3b5743be9296	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−10) × 10	−100	INTEGERS_MULTIPLICATION	EASY	{negative-times-positive}
cmk37a6vy00hxu2l7bk376ulg	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point N is at (10, -6). What is x - y?	16	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00hyu2l7wcy5qxuy	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (-5, 1). What is 3x?	-15	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,arithmetic}
cmk37a6vz00hzu2l70cd763th	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -2 and y = -9?	(-2, -9)	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,negative-integers,basic}
cmk37a6vz00i0u2l7x6bg97b5	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point O is at (8, -7). What is x + y?	1	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00i1u2l7dm29luy6	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has coordinates (-9, 5). What is y - x?	14	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,arithmetic}
cmk37a6vz00i2u2l7t5ct56dt	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 1 and y = -1?	(1, -1)	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,negative-integers,basic}
cmk37a6vz00i3u2l70481ftxj	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point P is at (-6, -7). What is the product xy?	42	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vz00i4u2l7sj2q9hsm	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (5, -5). What is x + y?	0	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00i5u2l7u7occdvg	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -10 and y = -10?	(-10, -10)	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,negative-integers,basic}
cmk37a6vz00i6u2l7d6uqevwf	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point Q is at (-3, 2). Which quadrant is it in?	Quadrant 2	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,quadrants}
cmk37a6vz00i7u2l7vxbaveed	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 4 and y = -9. What is 2x + y?	-1	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00i8u2l76g0kxyyb	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -8 and y = 10?	(-8, 10)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vz00i9u2l7ea5xilrp	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point R is at (-1, -6). What is x + y?	-7	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vz00iau2l7km2sb4n9	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (7, -8). What is the difference x - y?	15	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00ibu2l7hqikxbay	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -4 and y = -3?	(-4, -3)	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,negative-integers,basic}
cmk37a6vz00icu2l7se8n2tnj	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point S is at (9, -10). What is 2y?	-20	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00idu2l7u0bgrn1j	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has coordinates (-7, 6). What is x + y?	-1	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,arithmetic}
cmk37a6vz00ieu2l7i9uwtrme	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 2 and y = -4?	(2, -4)	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,negative-integers,basic}
cmk37a6vz00ifu2l75xtmqs38	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point T is at (-9, -8). What is the product of its coordinates?	72	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vz00igu2l7nqvjwg4q	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (6, -5). What is xy?	-30	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00ihu2l7zqqmeqwf	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -2 and y = 8?	(-2, 8)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vz00iiu2l7n5ptxdt8	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point U is at (-5, -10). What is y - x?	-5	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vz00iju2l77yg4gijn	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 10 and y = -1. What is x + y?	9	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00iku2l7fpqw1csu	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -6 and y = 4?	(-6, 4)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vz00ilu2l740weljdh	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point V is at (3, -8). What is 3y?	-24	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00imu2l7g6g68lau	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (-10, -4). What is 2x?	-20	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vz00inu2l754hrv8ul	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 8 and y = -2?	(8, -2)	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,negative-integers,basic}
cmk37a6vz00iou2l708l6ag9x	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point W is at (-3, 7). What is the sum of its coordinates?	4	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,arithmetic}
cmk37a6vz00ipu2l7ii0ysoxh	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 1 and y = -10. What is x - y?	11	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00iqu2l7d564x8gp	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -7 and y = -6?	(-7, -6)	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,negative-integers,basic}
cmk37a6vz00iru2l7d6a8b0az	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point X is at (4, -3). Which quadrant is it in?	Quadrant 4	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,quadrants}
cmk37a6vz00isu2l7oasyghv0	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (-8, 9). What is 2x?	-16	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,arithmetic}
cmk37a6vz00itu2l7he6ytwsi	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -1 and y = -5?	(-1, -5)	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,negative-integers,basic}
cmk37a6vz00iuu2l7aqd014vm	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point Y is at (9, -4). What is x + y?	5	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00ivu2l7npmbtpp6	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has coordinates (-4, 1). What is the product of its coordinates?	-4	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,arithmetic}
cmk37a6vz00iwu2l7a6nriqzu	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 5 and y = -6?	(5, -6)	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,negative-integers,basic}
9730cdec-bfbc-4ff0-a16a-3057344d1aee	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−7) × (−10)	70	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
85420dbb-7a23-4967-9270-4141a6ca60b2	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−2) × (−11)	22	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6vz00iyu2l7uvr8oey4	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (2, -1). What is 4x?	8	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00izu2l7zn6c3apf	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -9 and y = 2?	(-9, 2)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vz00j0u2l7c1x43in1	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point A1 is at (-2, -1). What is y - x?	1	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vz00j1u2l78o2i6qs7	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 6 and y = -7. What is xy?	-42	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00j2u2l7comj2nmo	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -5 and y = 10?	(-5, 10)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vz00j3u2l7h3p2w8sm	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point B1 is at (10, -9). What is x - y?	19	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00j4u2l77r02o2ro	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (-6, -2). What is 3x?	-18	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vz00j5u2l7us19st68	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 7 and y = -10?	(7, -10)	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,negative-integers,basic}
cmk37a6vz00j6u2l7tpzqojoy	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point C1 is at (-3, 5). What is the sum of its coordinates?	2	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,arithmetic}
cmk37a6vz00j7u2l7em7jqovt	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = 8 and y = -9. What is 2x + 3y?	-11	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00j8u2l713p98qxm	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (0, 0) and (3, 4).	5	COORDINATES_PLOTTING	HARD	{distance,origin,pythagorean}
cmk37a6vz00j9u2l785dj2z0l	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (1, 2) and (4, 6).	5	COORDINATES_PLOTTING	HARD	{distance,pythagorean}
cmk37a6vz00jau2l7y91nqchw	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (2, 4) and (8, 10)?	(5, 7)	COORDINATES_PLOTTING	HARD	{midpoint}
cmk37a6vz00jbu2l7b6dtyk71	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (-3, 0) and (0, 4).	5	COORDINATES_PLOTTING	HARD	{distance,negative}
cmk37a6vz00jcu2l725w91v1m	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (-2, 6) and (4, -2)?	(1, 2)	COORDINATES_PLOTTING	HARD	{midpoint,negative}
cmk37a6vz00jdu2l7s79jqhyx	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (1.5, 3). What is its x-coordinate?	1.5	COORDINATES_PLOTTING	HARD	{decimals,coordinates}
cmk37a6vz00jeu2l7oop986u9	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 2.5 and y = -4.5?	(2.5, -4.5)	COORDINATES_PLOTTING	HARD	{decimals,negative,basic}
cmk37a6vz00jfu2l7mgas6ej3	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (5, 0) and (5, 12).	12	COORDINATES_PLOTTING	HARD	{distance,vertical}
cmk37a6vz00jgu2l7f9e4w5qu	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (-2, 3) and (10, 3).	12	COORDINATES_PLOTTING	HARD	{distance,horizontal}
cmk37a6vz00jhu2l77mr4f3v9	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (0, 0) and (10, 6)?	(5, 3)	COORDINATES_PLOTTING	HARD	{midpoint,origin}
cmk37a6vz00jiu2l7qcr7dc0q	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has coordinates (-15, 20). What is x + y?	5	COORDINATES_PLOTTING	HARD	{large-numbers,arithmetic}
cmk37a6vz00jju2l70d8zxo28	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (0, 0) and (5, 12).	13	COORDINATES_PLOTTING	HARD	{distance,origin,pythagorean}
cmk37a6vz00jku2l78ym43vme	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (-8, 4) and (6, -10)?	(-1, -3)	COORDINATES_PLOTTING	HARD	{midpoint,negative}
cmk37a6vz00jlu2l7cpqae3yj	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point D1 is at (3.5, -2.5). What is its y-coordinate?	-2.5	COORDINATES_PLOTTING	HARD	{decimals,coordinates}
cmk37a6vz00jmu2l7wmh8qpx2	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (-5, -5) and (7, -5).	12	COORDINATES_PLOTTING	HARD	{distance,horizontal,negative}
cmk37a6vz00jnu2l7nlxm0pnp	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -3.5 and y = 7.5?	(-3.5, 7.5)	COORDINATES_PLOTTING	HARD	{decimals,basic}
cmk37a6vz00jou2l70zlcfo66	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (0, -6) and (0, 8).	14	COORDINATES_PLOTTING	HARD	{distance,vertical}
cmk37a6vz00jpu2l78wod0iln	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (12, 5) and (-4, 9)?	(4, 7)	COORDINATES_PLOTTING	HARD	{midpoint,mixed}
cmk37a6vz00jqu2l7fytoy6ce	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (-18, -12). What is the product of its coordinates?	216	COORDINATES_PLOTTING	HARD	{large-numbers,arithmetic}
cmk37a6vz00jru2l7ny2g59m8	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (0, 0) and (8, 15).	17	COORDINATES_PLOTTING	HARD	{distance,origin,pythagorean}
cmk37a6vz00jsu2l7hnp6l6rt	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (-10, -20) and (14, 8)?	(2, -6)	COORDINATES_PLOTTING	HARD	{midpoint,large-numbers}
cmk37a6vz00jtu2l7em7tm1o9	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point E1 is at (5.5, 8.5). What is x + y?	14	COORDINATES_PLOTTING	HARD	{decimals,arithmetic}
cmk37a6vz00juu2l7egihjh9d	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (-6, 8) and (-6, -4).	12	COORDINATES_PLOTTING	HARD	{distance,vertical,negative}
cmk37a6vz00jvu2l7j4c59g4k	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 4.25 and y = -6.75?	(4.25, -6.75)	COORDINATES_PLOTTING	HARD	{decimals,negative,basic}
cmk37a6vz00jwu2l7vgnmkq6m	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (0, 0) and (9, 12).	15	COORDINATES_PLOTTING	HARD	{distance,origin,pythagorean}
cmk37a6vz00jxu2l738pfc01a	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (7, -11) and (-3, 5)?	(2, -3)	COORDINATES_PLOTTING	HARD	{midpoint,negative}
cmk37a6wi00m6u2l7qtgh3vdj	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 4, 9, 14, 17	11	DATA_ANALYSIS	EASY	{mean,basic}
8a2d69f7-a9f3-4d06-9497-3f1adeb0b54b	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−10) × (−2)	20	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
224dac7a-70ef-4e95-a725-beaa7a1ed1b1	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−5) × (−6)	30	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
c83191b9-a2c4-4eb8-9633-4e136ca6422a	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−1) × (−4)	4	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6vz00jzu2l7fu2gkm4w	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (3, 7) and (3, -5).	12	COORDINATES_PLOTTING	HARD	{distance,vertical}
cmk37a6vz00k0u2l7omlu60nb	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (-15, 9) and (5, -7)?	(-5, 1)	COORDINATES_PLOTTING	HARD	{midpoint,large-numbers}
cmk37a6vz00k1u2l73m8010vo	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point F1 is at (-7.5, -3.5). What is the sum of its coordinates?	-11	COORDINATES_PLOTTING	HARD	{decimals,arithmetic,negative}
cmk37a6vz00k2u2l7lgvoq5mm	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (0, 0) and (20, 21).	29	COORDINATES_PLOTTING	HARD	{distance,origin,pythagorean,large-numbers}
cmk37a6vz00k3u2l7gjolger9	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (-12, 18) and (8, -6)?	(-2, 6)	COORDINATES_PLOTTING	HARD	{midpoint,large-numbers}
cmk37a6vz00k4u2l7d73hopvz	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (6.75, -9.25). What is its x-coordinate?	6.75	COORDINATES_PLOTTING	HARD	{decimals,coordinates}
cmk37a6vz00k5u2l7oe6elsrd	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (-8, 15) and (-8, 3).	12	COORDINATES_PLOTTING	HARD	{distance,vertical,negative}
cmk37a6vz00k6u2l73g961cbj	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -8.5 and y = -11.5?	(-8.5, -11.5)	COORDINATES_PLOTTING	HARD	{decimals,negative,basic}
cmk37a6vz00k7u2l7wmyx8edl	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (0, 0) and (7, 24).	25	COORDINATES_PLOTTING	HARD	{distance,origin,pythagorean}
cmk37a6vz00k8u2l7yc16xjfc	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (16, -8) and (-4, 12)?	(6, 2)	COORDINATES_PLOTTING	HARD	{midpoint,large-numbers}
cmk37a6vz00k9u2l7kyrdpiq1	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point G1 is at (-18, 24). What is the difference y - x?	42	COORDINATES_PLOTTING	HARD	{large-numbers,arithmetic}
cmk37a6vz00kau2l72bvahwxa	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (10, -5) and (22, -5).	12	COORDINATES_PLOTTING	HARD	{distance,horizontal}
cmk37a6vz00kbu2l72r4u9vbb	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (-20, -14) and (10, 6)?	(-5, -4)	COORDINATES_PLOTTING	HARD	{midpoint,large-numbers}
cmk37a6vz00kcu2l7nej7e055	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has coordinates (12.5, 15.5). What is x + y?	28	COORDINATES_PLOTTING	HARD	{decimals,arithmetic}
cmk37a6vz00kdu2l7bswuwhga	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (0, 0) and (15, 20).	25	COORDINATES_PLOTTING	HARD	{distance,origin,pythagorean,large-numbers}
cmk37a6vz00keu2l7i3zyd6k5	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (-9, 17) and (11, -3)?	(1, 7)	COORDINATES_PLOTTING	HARD	{midpoint,large-numbers}
cmk37a6vz00kfu2l72771f2zk	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point H1 is at (-10.5, 4.5). What is its y-coordinate?	4.5	COORDINATES_PLOTTING	HARD	{decimals,coordinates}
cmk37a6vz00kgu2l7rq7v50cf	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (-7, -9) and (5, -9).	12	COORDINATES_PLOTTING	HARD	{distance,horizontal,negative}
cmk37a6vz00khu2l7qitk77nb	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 13.25 and y = -8.75?	(13.25, -8.75)	COORDINATES_PLOTTING	HARD	{decimals,negative,basic}
cmk37a6vz00kiu2l71htqlh70	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (0, 16) and (0, -14).	30	COORDINATES_PLOTTING	HARD	{distance,vertical,large-numbers}
cmk37a6vz00kju2l7cns91l79	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What is the midpoint of (18, -22) and (-6, 10)?	(6, -6)	COORDINATES_PLOTTING	HARD	{midpoint,large-numbers}
cmk37a6vz00kku2l7lthtnt0m	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (-25, -15). What is the product of its coordinates?	375	COORDINATES_PLOTTING	HARD	{large-numbers,arithmetic}
cmk37a6vz00klu2l7a9vpc1d3	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Find the distance between (0, 0) and (12, 16).	20	COORDINATES_PLOTTING	HARD	{distance,origin,pythagorean}
cmk37a6vz00kmu2l7gfbfra3i	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point D2 is at (-8, -9). What is the sum of its coordinates?	-17	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vz00knu2l7e1tnrezj	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 3 and y = -5?	(3, -5)	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,negative-integers,basic}
cmk37a6vz00kou2l7ji5v68mr	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = -7 and y = -4. What is the product xy?	28	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vz00kpu2l7m40ounoe	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point E2 is at (10, -7). What is x + y?	3	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00kqu2l706x33dlu	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -9 and y = 10?	(-9, 10)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vz00kru2l70x88szda	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (1, -8). What is 2x + y?	-6	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,arithmetic}
cmk37a6vz00ksu2l7flbbn2ql	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point F2 is at (-10, -7). What is x - y?	-3	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vz00ktu2l7z2fey7w9	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = 9 and y = -10?	(9, -10)	COORDINATES_PLOTTING	MEDIUM	{quadrant-4,negative-integers,basic}
cmk37a6wi00kuu2l7klraxa99	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 2, 4, 6	4	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00kvu2l708474zc3	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 3, 5, 7	5	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00kwu2l7da8kuzi5	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 2, 3, 3, 4	3	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00kxu2l7mpuifj7o	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 5, 10, 15	10	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00kyu2l7v4nxlw9i	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 5, 10, 15	10	DATA_ANALYSIS	EASY	{mean,basic}
d26fabb6-40fd-4258-b516-ca57e33877d3	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−9) × (−12)	108	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
d40e188a-5673-4b32-a6b2-71a32b6345e0	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−4) × (−3)	12	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
d189c503-190e-4ad8-ba94-e15dec9774a8	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−12) × (−1)	12	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6wi00l0u2l781u90a0m	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 1, 2, 2, 3, 3, 3	3	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00l1u2l7dlko3t9u	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 2, 8, 12, 20	18	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00l2u2l7zpah31t1	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 3, 6, 9, 12	7.5	DATA_ANALYSIS	EASY	{mean,basic,decimal}
cmk37a6wi00l3u2l7p4pl7foq	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 1, 3, 5, 7, 9	5	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00l4u2l7yky1mrhx	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 4, 8, 12	8	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00l5u2l7mj1t47dr	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 10, 20, 30	20	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00l6u2l7qnjm0qmb	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 5, 5, 6, 7	5	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00l7u2l7hav0avs6	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 1, 5, 9, 13	12	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00l8u2l7cp9urrdl	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 6, 12, 18	12	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00l9u2l7v2u9d529	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 5, 10, 15, 20	12.5	DATA_ANALYSIS	EASY	{median,basic,even-count,decimal}
cmk37a6wi00lau2l7toqgfnu9	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 4, 4, 4, 5, 6	4	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00lbu2l7n6smdu37	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 3, 7, 11, 15	12	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00lcu2l7fgep544a	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 2, 5, 8, 9	6	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00ldu2l7av9akk6y	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 2, 6, 10, 14, 18	10	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00leu2l7duzyow5q	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 7, 14, 21	14	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00lfu2l7kb878cuc	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 4, 8, 12	8	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00lgu2l74bhhejzh	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 6, 7, 7, 8	7	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00lhu2l70ppnxw56	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 10, 20, 30, 40	30	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00liu2l78h0oqfai	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 8, 16, 24	16	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00lju2l7lrfimvgw	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 1, 2, 3, 4	2.5	DATA_ANALYSIS	EASY	{median,basic,even-count,decimal}
cmk37a6wi00lku2l7u55ts0s1	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 8, 8, 9, 10	8	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00llu2l7v5elbc6v	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 5, 15, 25	20	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00lmu2l7naf78c2m	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 1, 4, 7, 8	5	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00lnu2l7ousdqmu8	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 3, 9, 15, 21, 27	15	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00lou2l7rpmb94cf	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 9, 18, 27	18	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00lpu2l7tpzgobiq	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 6, 12, 18	12	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00lqu2l7gyxn3wyu	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 9, 10, 10, 11	10	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00lru2l76l2cr7l1	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 2, 6, 10, 14	12	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00lsu2l7o6dg1uce	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 10, 20, 30	20	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00ltu2l76wlwi8wc	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 3, 6, 9, 12	7.5	DATA_ANALYSIS	EASY	{median,basic,even-count,decimal}
cmk37a6wi00luu2l7y5lwoskh	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 11, 11, 12, 13	11	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00lvu2l7gkbmzu99	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 4, 12, 20, 28	24	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00lwu2l7enrog3gz	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 3, 7, 11, 15	9	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00lxu2l75ea90lxa	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 4, 12, 20, 28, 36	20	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00lyu2l7alc8qlgv	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 11, 22, 33	22	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00lzu2l7q5bsoojm	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 7, 14, 21	14	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00m0u2l7anu9uhos	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 12, 13, 13, 14	13	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00m1u2l7r9sese48	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 6, 18, 30	24	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00m2u2l7vq1qpb4s	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 12, 24, 36	24	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00m3u2l7wny52ft3	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 2, 8, 14, 20	11	DATA_ANALYSIS	EASY	{median,basic,even-count}
cmk37a6wi00m4u2l7nix2f0ky	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 14, 14, 15, 16	14	DATA_ANALYSIS	EASY	{mode,basic}
06fe46c1-617f-4c66-9add-5e45d0a59b87	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−8) × (−14)	112	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
16e39ed9-8390-4b39-810e-5d27a128fb40	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−3) × (−13)	39	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
808f053a-c64c-4899-a5fa-819cf4659bc8	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−11) × (−5)	55	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6wi00m8u2l7gwut4gi6	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 13, 26, 39	26	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00m9u2l7rglbercc	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 8, 16, 24	16	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00mau2l7148v0r0v	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 15, 16, 16, 17	16	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00mbu2l7zsoy5ns7	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 8, 24, 40	32	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00mcu2l78g39a69u	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 14, 28, 42	28	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00mdu2l7hwgr5etz	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 4, 10, 16, 22	13	DATA_ANALYSIS	EASY	{median,basic,even-count}
cmk37a6wi00meu2l7gyuoguvi	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 17, 17, 18, 19	17	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00mfu2l76dxdxnso	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 9, 27, 45, 63	54	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00mgu2l7udwpyn9l	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 5, 11, 17, 19	13	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00mhu2l7fvk6vr1g	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 6, 18, 30, 42, 54	30	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00miu2l7y2hd13i1	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 15, 30, 45	30	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00mju2l7j38049gb	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 9, 18, 27	18	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00mku2l7h37ybhwa	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 18, 19, 19, 20	19	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00mlu2l7xzwedrp7	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 10, 30, 50	40	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00mmu2l7dx3qfgs3	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 16, 32, 48	32	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00mnu2l7y6hylk2u	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 5, 12, 19, 26	15.5	DATA_ANALYSIS	EASY	{median,basic,even-count,decimal}
cmk37a6wi00mou2l7f6h8z7ba	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 20, 20, 21, 22	20	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00mpu2l7v3mfj1vo	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 11, 33, 55, 77	66	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00mqu2l7h4scs7sb	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 6, 13, 20, 21	15	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00mru2l74rlej5l7	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 7, 21, 35, 49, 63	35	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00msu2l7m6bziypc	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 17, 34, 51	34	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00mtu2l7w909lgua	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 10, 20, 30	20	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00muu2l755fbj76v	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 21, 22, 22, 23	22	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00mvu2l7kr4fdqex	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 12, 36, 60	48	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00mwu2l7fw8tlenq	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 18, 36, 54	36	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00mxu2l7alckohwl	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 6, 14, 22, 30	18	DATA_ANALYSIS	EASY	{median,basic,even-count}
cmk37a6wi00myu2l7yrqsn3jn	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 23, 23, 24, 25	23	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00mzu2l701waej5r	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 13, 39, 65, 91	78	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00n0u2l7pqg52tnb	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 7, 15, 23, 27	18	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00n1u2l7jb0rvwo6	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 8, 24, 40, 56, 72	40	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00n2u2l78mt7190e	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 19, 38, 57	38	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00n3u2l73gs2p3rq	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 11, 22, 33	22	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00n4u2l7rtitji8j	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 24, 25, 25, 26	25	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00n5u2l7t74o6d0t	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 14, 42, 70	56	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00n6u2l78i38ipzr	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 20, 40, 60	40	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00n7u2l77b4a40iy	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 7, 16, 25, 34	20.5	DATA_ANALYSIS	EASY	{median,basic,even-count,decimal}
cmk37a6wi00n8u2l74x38js64	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 26, 26, 27, 28	26	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wi00n9u2l7wjni28wu	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 15, 45, 75, 105	90	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wi00nau2l7vd7b0si0	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 8, 17, 26, 29	20	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wi00nbu2l7unbcf1b0	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 9, 27, 45, 63, 81	45	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00ncu2l7vqj7o1ri	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 21, 42, 63	42	DATA_ANALYSIS	EASY	{mean,basic}
b9e81709-a3a2-4ca9-98f9-5430d0e0132b	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−6) × (−7)	42	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
73fbda19-6491-44e9-883d-756e5796c735	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−10) × (−10)	100	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6wj00neu2l7gzeg5cjn	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 27, 28, 28, 29	28	DATA_ANALYSIS	EASY	{mode,basic}
cmk37a6wj00nfu2l7jho43iz2	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 16, 48, 80	64	DATA_ANALYSIS	EASY	{range,basic}
cmk37a6wj00ngu2l7bje53jih	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 22, 44, 66	44	DATA_ANALYSIS	EASY	{mean,basic}
cmk37a6wj00nhu2l7djfoh465	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 2, 4, 6, 8, 10, 12	7	DATA_ANALYSIS	MEDIUM	{mean,six-values}
cmk37a6wj00niu2l7cb4su156	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 3, 7, 11, 15, 19, 23	13	DATA_ANALYSIS	MEDIUM	{median,even-count,six-values}
cmk37a6wj00nju2l7gpwf57it	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 5, 5, 6, 7, 8, 8, 8	8	DATA_ANALYSIS	MEDIUM	{mode,seven-values}
cmk37a6wj00nku2l70cpbnipv	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 12, 18, 24, 30, 36, 42	30	DATA_ANALYSIS	MEDIUM	{range,six-values}
cmk37a6wj00nlu2l7i0pisgcc	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 10, 15, 20, x, 30. If the mean is 20, find x.	25	DATA_ANALYSIS	MEDIUM	{mean,missing-value,algebra}
cmk37a6wj00nmu2l7tbd2k76j	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 2, 5, 8, x, 14. If the median is 8, find a possible value for x.	8 or greater	DATA_ANALYSIS	MEDIUM	{median,missing-value}
cmk37a6wj00nnu2l70sxnxl75	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 5, 10, 15, 20, 25, 30	17.5	DATA_ANALYSIS	MEDIUM	{mean,six-values,decimal}
cmk37a6wj00nou2l78e80yyxj	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Which is larger: the mean or median of 3, 5, 7, 9, 21?	mean	DATA_ANALYSIS	MEDIUM	{compare,mean-median,outlier}
cmk37a6wj00npu2l7mpq67keq	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean and median of: 4, 6, 8, 10. Are they equal?	Both are 7	DATA_ANALYSIS	MEDIUM	{mean,median,compare,equal}
cmk37a6wj00nqu2l77r126u9w	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A class has test scores: 60, 70, 75, 80, 90. What is the range?	30	DATA_ANALYSIS	MEDIUM	{range,context,test-scores}
cmk37a6wj00nru2l73bxafvok	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 3, 6, 9, 12, 15, 18	10.5	DATA_ANALYSIS	MEDIUM	{mean,six-values,decimal}
cmk37a6wj00nsu2l7bwfxrizs	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 4, 8, 12, 16, 20, 24	14	DATA_ANALYSIS	MEDIUM	{median,even-count,six-values}
cmk37a6wj00ntu2l7ix4tv6pk	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 6, 6, 7, 8, 9, 9, 9, 10	9	DATA_ANALYSIS	MEDIUM	{mode,eight-values}
cmk37a6wj00nuu2l73blwwob1	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 15, 22, 29, 36, 43, 50	35	DATA_ANALYSIS	MEDIUM	{range,six-values}
cmk37a6wj00nvu2l7hp6ukims	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 12, 16, 20, x, 28. If the mean is 20, find x.	24	DATA_ANALYSIS	MEDIUM	{mean,missing-value,algebra}
cmk37a6wj00nwu2l76y69smbu	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 3, 6, 9, x, 15. If the median is 9, find a possible value for x.	9 or greater	DATA_ANALYSIS	MEDIUM	{median,missing-value}
cmk37a6wj00nxu2l765ol91q6	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 6, 12, 18, 24, 30, 36	21	DATA_ANALYSIS	MEDIUM	{mean,six-values}
cmk37a6wj00nyu2l78tm1rsfm	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Which is larger: the mean or median of 4, 6, 8, 10, 32?	mean	DATA_ANALYSIS	MEDIUM	{compare,mean-median,outlier}
cmk37a6wj00nzu2l7qmtxiyew	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean and median of: 5, 10, 15, 20. Are they equal?	Both are 12.5	DATA_ANALYSIS	MEDIUM	{mean,median,compare,equal}
cmk37a6wj00o0u2l7t6vy9qg3	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A group has ages: 12, 14, 15, 16, 18. What is the range?	6	DATA_ANALYSIS	MEDIUM	{range,context,ages}
cmk37a6wj00o1u2l7erx1kiy5	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 4, 8, 12, 16, 20, 24	14	DATA_ANALYSIS	MEDIUM	{mean,six-values}
cmk37a6wj00o2u2l7hlenegp4	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 5, 10, 15, 20, 25, 30	17.5	DATA_ANALYSIS	MEDIUM	{median,even-count,six-values,decimal}
cmk37a6wj00o3u2l7kg0r1q16	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 7, 7, 8, 9, 10, 10, 10, 11	10	DATA_ANALYSIS	MEDIUM	{mode,eight-values}
cmk37a6wj00o4u2l7tvqea6p2	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 18, 26, 34, 42, 50, 58	40	DATA_ANALYSIS	MEDIUM	{range,six-values}
cmk37a6wj00o5u2l7ke0kw019	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 14, 18, 22, x, 30. If the mean is 22, find x.	26	DATA_ANALYSIS	MEDIUM	{mean,missing-value,algebra}
cmk37a6wj00o6u2l7hpfiy5cl	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 4, 7, 10, x, 16. If the median is 10, find a possible value for x.	10 or greater	DATA_ANALYSIS	MEDIUM	{median,missing-value}
cmk37a6wj00o7u2l7bh04vwj1	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 7, 14, 21, 28, 35, 42	24.5	DATA_ANALYSIS	MEDIUM	{mean,six-values,decimal}
cmk37a6wj00o8u2l7ndnlw5xc	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Which is larger: the mean or median of 5, 7, 9, 11, 43?	mean	DATA_ANALYSIS	MEDIUM	{compare,mean-median,outlier}
cmk37a6wj00o9u2l78wik0xxs	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean and median of: 6, 12, 18, 24. Are they equal?	Both are 15	DATA_ANALYSIS	MEDIUM	{mean,median,compare,equal}
cmk37a6wj00oau2l78w1an23z	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A store has prices: $5, $8, $10, $12, $15. What is the range?	$10	DATA_ANALYSIS	MEDIUM	{range,context,money}
cmk37a6wj00obu2l7gzzlezch	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 5, 10, 15, 20, 25, 30	17.5	DATA_ANALYSIS	MEDIUM	{mean,six-values,decimal}
cmk37a6wj00ocu2l7tanxyb98	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 6, 12, 18, 24, 30, 36	21	DATA_ANALYSIS	MEDIUM	{median,even-count,six-values}
cmk37a6wj00odu2l7fzl60cvu	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 8, 8, 9, 10, 11, 11, 11, 12	11	DATA_ANALYSIS	MEDIUM	{mode,eight-values}
e0f432b2-60c2-4023-b7b4-1d7fbff1ee6c	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−11) × (−14)	154	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
1cd95ba6-5f36-4eb4-a04a-2235d4b03101	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−25) × (−7)	175	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
c3e33cda-b989-4bde-b6f5-c53e1dc5c65d	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−15) × (−5)	75	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6wj00ofu2l72omx9ejd	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 16, 20, 24, x, 32. If the mean is 24, find x.	28	DATA_ANALYSIS	MEDIUM	{mean,missing-value,algebra}
cmk37a6wj00ogu2l74e2e40n8	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 5, 8, 11, x, 17. If the median is 11, find a possible value for x.	11 or greater	DATA_ANALYSIS	MEDIUM	{median,missing-value}
cmk37a6wj00ohu2l7mwi4fd88	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 8, 16, 24, 32, 40, 48	28	DATA_ANALYSIS	MEDIUM	{mean,six-values}
cmk37a6wj00oiu2l7ebzda4od	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Which is larger: the mean or median of 6, 8, 10, 12, 54?	mean	DATA_ANALYSIS	MEDIUM	{compare,mean-median,outlier}
cmk37a6wj00oju2l7lpm486s8	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean and median of: 7, 14, 21, 28. Are they equal?	Both are 17.5	DATA_ANALYSIS	MEDIUM	{mean,median,compare,equal}
cmk37a6wj00oku2l7nqxhufvp	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset of heights (cm): 150, 155, 160, 165, 170. What is the range?	20 cm	DATA_ANALYSIS	MEDIUM	{range,context,heights}
cmk37a6wj00olu2l7k2m6w5b9	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 6, 12, 18, 24, 30, 36	21	DATA_ANALYSIS	MEDIUM	{mean,six-values}
cmk37a6wj00omu2l759a5rks9	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 7, 14, 21, 28, 35, 42	24.5	DATA_ANALYSIS	MEDIUM	{median,even-count,six-values,decimal}
cmk37a6wj00onu2l7fesx7hex	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 9, 9, 10, 11, 12, 12, 12, 13	12	DATA_ANALYSIS	MEDIUM	{mode,eight-values}
cmk37a6wj00oou2l7iok7vkpv	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 24, 34, 44, 54, 64, 74	50	DATA_ANALYSIS	MEDIUM	{range,six-values}
cmk37a6wj00opu2l7z80gjhz8	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 18, 22, 26, x, 34. If the mean is 26, find x.	30	DATA_ANALYSIS	MEDIUM	{mean,missing-value,algebra}
cmk37a6wj00oqu2l7wsym7vo3	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 6, 9, 12, x, 18. If the median is 12, find a possible value for x.	12 or greater	DATA_ANALYSIS	MEDIUM	{median,missing-value}
cmk37a6wj00oru2l7ah3k7lim	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 9, 18, 27, 36, 45, 54	31.5	DATA_ANALYSIS	MEDIUM	{mean,six-values,decimal}
cmk37a6wj00osu2l7bvndssek	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Which is larger: the mean or median of 7, 9, 11, 13, 65?	mean	DATA_ANALYSIS	MEDIUM	{compare,mean-median,outlier}
cmk37a6wj00otu2l7pnrrbpp8	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean and median of: 8, 16, 24, 32. Are they equal?	Both are 20	DATA_ANALYSIS	MEDIUM	{mean,median,compare,equal}
cmk37a6wj00ouu2l78ecgdc7o	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Daily temperatures (°C): 18, 20, 22, 24, 26. What is the range?	8°C	DATA_ANALYSIS	MEDIUM	{range,context,temperature}
cmk37a6wj00ovu2l7obs6vksd	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has mean 15 and contains: 10, 12, x, 18, 20. Find x.	15	DATA_ANALYSIS	HARD	{mean,missing-value,algebra}
cmk37a6wj00owu2l7ykemd7ur	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has median 20 and contains five values. The first three are 12, 16, 20. What could the other two values be?	Any values ≥ 20	DATA_ANALYSIS	HARD	{median,missing-value,reasoning}
cmk37a6wj00oxu2l7z4i1rk0b	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Dataset A: 5, 10, 15, 20, 25. Dataset B: 10, 12, 15, 18, 20. Which has the larger range?	A	DATA_ANALYSIS	HARD	{range,compare,two-datasets}
cmk37a6wj00oyu2l7ahaj9v5t	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 8, 12, 16, 20, 24. If one value is changed to 44, how does the mean change?	increases by 4	DATA_ANALYSIS	HARD	{mean,change,outlier-effect}
cmk37a6wj00ozu2l7oss3aeoi	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Two datasets have the same mean of 20. Dataset A has range 10, Dataset B has range 40. Which is more spread out?	B	DATA_ANALYSIS	HARD	{range,spread,compare}
cmk37a6wj00p0u2l7rt3mnezv	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A class has 5 students with mean score 80. A 6th student joins with score 92. What is the new mean?	82	DATA_ANALYSIS	HARD	{mean,adding-value,context}
cmk37a6wj00p1u2l7tnut9rm4	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	The median of 7, 9, x, 15, 17 is 12. Find x.	12	DATA_ANALYSIS	HARD	{median,missing-value,algebra}
cmk37a6wj00p2u2l7t44e2dhv	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset: 10, 15, 20, 25, 30. If each value increases by 5, what happens to the range?	stays the same	DATA_ANALYSIS	HARD	{range,transformation,constant-add}
cmk37a6wj00p3u2l7w65h4trt	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Exam scores: 60, 70, 75, 80, 85, 90. One student improves from 60 to 80. How does the median change?	increases by 2.5	DATA_ANALYSIS	HARD	{median,change,context}
cmk37a6wj00p4u2l7w5h512lu	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Dataset: 5, 10, 15, 20, 100. Why is the mean much larger than the median?	outlier (100)	DATA_ANALYSIS	HARD	{mean,median,outlier,explain}
cmk37a6wj00p5u2l7tw8jr8ax	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has mean 18 and contains: 12, 14, x, 20, 22. Find x.	22	DATA_ANALYSIS	HARD	{mean,missing-value,algebra}
cmk37a6wj00p6u2l716jowogs	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has median 25 and contains five values. The first three are 15, 20, 25. What could the other two values be?	Any values ≥ 25	DATA_ANALYSIS	HARD	{median,missing-value,reasoning}
cmk37a6wj00p7u2l76ojnw8mt	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Dataset A: 6, 12, 18, 24, 30. Dataset B: 12, 14, 18, 22, 24. Which has the larger range?	A	DATA_ANALYSIS	HARD	{range,compare,two-datasets}
cmk37a6wj00p8u2l757601h9o	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 10, 15, 20, 25, 30. If one value is changed to 50, how does the mean change?	increases by 4	DATA_ANALYSIS	HARD	{mean,change,outlier-effect}
cmk37a6wj00p9u2l77x3f0qhm	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Two datasets have the same mean of 25. Dataset A has range 15, Dataset B has range 50. Which is more spread out?	B	DATA_ANALYSIS	HARD	{range,spread,compare}
5cf156d0-4d32-492f-9bc5-dc5f7cf5614d	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−9) × (−9)	81	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
0d041f66-b4b9-49c4-8faf-31f6fdc5fde7	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−13) × (−6)	78	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6wj00pxu2l74t9nxqn9	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 8, 18, 28, 38	23	DATA_ANALYSIS	EASY	{median,basic,even-count,set-11}
cmk37a6wj00pyu2l7fabkf57z	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 29, 30, 30, 31	30	DATA_ANALYSIS	EASY	{mode,basic,set-11}
cmk37a6wj00pzu2l7uumgy387	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 17, 51, 85	68	DATA_ANALYSIS	EASY	{range,basic,set-11}
cmk37a6wj00q0u2l7qmzlrqqx	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 23, 46, 69	46	DATA_ANALYSIS	EASY	{mean,basic,set-11}
cmk37a6wj00q1u2l7kp090umk	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 10, 30, 50, 70, 90	50	DATA_ANALYSIS	EASY	{median,basic,odd-count,set-11}
cmk37a6wj00pbu2l7qkvzjrz4	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	The median of 8, 10, x, 16, 18 is 14. Find x.	14	DATA_ANALYSIS	HARD	{median,missing-value,algebra}
cmk37a6wj00pcu2l7y45mvvtv	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset: 12, 18, 24, 30, 36. If each value increases by 6, what happens to the range?	stays the same	DATA_ANALYSIS	HARD	{range,transformation,constant-add}
cmk37a6wj00pdu2l7oov11cho	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Test scores: 65, 75, 80, 85, 90, 95. One student improves from 65 to 85. How does the median change?	increases by 2.5	DATA_ANALYSIS	HARD	{median,change,context}
cmk37a6wj00peu2l7wtrkyvka	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Dataset: 6, 12, 18, 24, 120. Why is the mean much larger than the median?	outlier (120)	DATA_ANALYSIS	HARD	{mean,median,outlier,explain}
cmk37a6wj00pfu2l7wfnq3mz5	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has mean 20 and contains: 14, 16, x, 22, 24. Find x.	24	DATA_ANALYSIS	HARD	{mean,missing-value,algebra}
cmk37a6wj00pgu2l7c0icrjxi	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has median 30 and contains five values. The first three are 20, 25, 30. What could the other two values be?	Any values ≥ 30	DATA_ANALYSIS	HARD	{median,missing-value,reasoning}
cmk37a6wj00phu2l7kjimhf37	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Dataset A: 7, 14, 21, 28, 35. Dataset B: 14, 16, 21, 26, 28. Which has the larger range?	A	DATA_ANALYSIS	HARD	{range,compare,two-datasets}
cmk37a6wj00piu2l7sta0gl6g	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 12, 18, 24, 30, 36. If one value is changed to 60, how does the mean change?	increases by 4.8	DATA_ANALYSIS	HARD	{mean,change,outlier-effect}
cmk37a6wj00pju2l7litmeq15	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Two datasets have the same mean of 30. Dataset A has range 20, Dataset B has range 60. Which is more spread out?	B	DATA_ANALYSIS	HARD	{range,spread,compare}
cmk37a6wj00pku2l7j68cq12v	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A team has 5 players with mean score 40. A 6th player joins with score 58. What is the new mean?	43	DATA_ANALYSIS	HARD	{mean,adding-value,context}
cmk37a6wj00plu2l7nr7qc7mn	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	The median of 9, 11, x, 17, 19 is 15. Find x.	15	DATA_ANALYSIS	HARD	{median,missing-value,algebra}
cmk37a6wj00pmu2l79y7haiqz	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset: 14, 21, 28, 35, 42. If each value increases by 7, what happens to the range?	stays the same	DATA_ANALYSIS	HARD	{range,transformation,constant-add}
cmk37a6wj00pnu2l7ejhxuqt6	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Quiz scores: 70, 80, 85, 90, 95, 100. One student improves from 70 to 90. How does the median change?	increases by 2.5	DATA_ANALYSIS	HARD	{median,change,context}
cmk37a6wj00pou2l7dva6q88a	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Dataset: 7, 14, 21, 28, 140. Why is the mean much larger than the median?	outlier (140)	DATA_ANALYSIS	HARD	{mean,median,outlier,explain}
cmk37a6wj00ppu2l7d7husxt8	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has mean 22 and contains: 16, 18, x, 24, 26. Find x.	26	DATA_ANALYSIS	HARD	{mean,missing-value,algebra}
cmk37a6wj00pqu2l71h7gcd9d	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has median 35 and contains five values. The first three are 25, 30, 35. What could the other two values be?	Any values ≥ 35	DATA_ANALYSIS	HARD	{median,missing-value,reasoning}
cmk37a6wj00pru2l7en2r3ttk	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Dataset A: 8, 16, 24, 32, 40. Dataset B: 16, 18, 24, 30, 32. Which has the larger range?	A	DATA_ANALYSIS	HARD	{range,compare,two-datasets}
cmk37a6wj00psu2l75k589iyx	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 14, 21, 28, 35, 42. If one value is changed to 70, how does the mean change?	increases by 5.6	DATA_ANALYSIS	HARD	{mean,change,outlier-effect}
cmk37a6wj00ptu2l7p578m8lt	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	The median of 10, 12, x, 18, 20 is 16. Find x.	16	DATA_ANALYSIS	HARD	{median,missing-value,algebra}
cmk37a6wj00puu2l71nwdvof6	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has mean 24 and contains: 18, 20, x, 26, 28. Find x.	28	DATA_ANALYSIS	HARD	{mean,missing-value,algebra}
cmk37a6wj00pvu2l72gmxhs8d	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Dataset A: 9, 18, 27, 36, 45. Dataset B: 18, 20, 27, 34, 36. Which has the larger range?	A	DATA_ANALYSIS	HARD	{range,compare,two-datasets}
cmk37a6wj00pwu2l7nw1ja36z	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	The median of 11, 13, x, 19, 21 is 17. Find x.	17	DATA_ANALYSIS	HARD	{median,missing-value,algebra}
cmk37a6wj00q2u2l7cbkvmvke	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 7, 16, 25, 34, 43, 52	29.5	DATA_ANALYSIS	MEDIUM	{mean,six-values,decimal}
cmk37a6wj00q3u2l7pd5rtoyq	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 8, 18, 28, 38, 48, 58	33	DATA_ANALYSIS	MEDIUM	{median,even-count,six-values}
cmk37a6wj00q4u2l7ezonb6kx	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 10, 10, 11, 12, 13, 13, 13, 14	13	DATA_ANALYSIS	MEDIUM	{mode,eight-values}
cmk37a6wj00q5u2l7nkxiaurt	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 27, 38, 49, 60, 71, 82	55	DATA_ANALYSIS	MEDIUM	{range,six-values}
cmk37a6wj00q6u2l7xp9333jz	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 20, 24, 28, x, 36. If the mean is 28, find x.	32	DATA_ANALYSIS	MEDIUM	{mean,missing-value,algebra}
b6074bfd-2e7b-4f7f-bfa5-32fefae5c2c1	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−14) × (−8)	112	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
ecc53896-ad09-4b07-8ea2-540bdc2f7c02	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−20) × (−4)	80	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
1369fb20-5179-4f16-8244-12bc6985e49b	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	6 × (−8) × 10	−480	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
cmk37a6wj00q8u2l72nsyolbq	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 10, 20, 30, 40, 50, 60	35	DATA_ANALYSIS	MEDIUM	{mean,six-values}
cmk37a6wj00q9u2l7s9elipcj	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Which is larger: the mean or median of 8, 10, 12, 14, 76?	mean	DATA_ANALYSIS	MEDIUM	{compare,mean-median,outlier}
cmk37a6wj00qau2l7uq09l777	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean and median of: 9, 18, 27, 36. Are they equal?	Both are 22.5	DATA_ANALYSIS	MEDIUM	{mean,median,compare,equal}
cmk37a6wj00qbu2l7eodwhcpm	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Weekly sales: $200, $250, $300, $350, $400. What is the range?	$200	DATA_ANALYSIS	MEDIUM	{range,context,money}
cmk37a6wj00qcu2l7irewhxh9	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 8, 18, 28, 38, 48, 58	33	DATA_ANALYSIS	MEDIUM	{mean,six-values}
cmk37a6wj00qdu2l7ahy56w6z	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 9, 20, 31, 42, 53, 64	36.5	DATA_ANALYSIS	MEDIUM	{median,even-count,six-values,decimal}
cmk37a6wj00qeu2l756kjam2u	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 11, 11, 12, 13, 14, 14, 14, 15	14	DATA_ANALYSIS	MEDIUM	{mode,eight-values}
cmk37a6wj00qfu2l71vjmp4hp	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 30, 42, 54, 66, 78, 90	60	DATA_ANALYSIS	MEDIUM	{range,six-values}
cmk37a6wj00qgu2l7my8ioqbl	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 22, 26, 30, x, 38. If the mean is 30, find x.	34	DATA_ANALYSIS	MEDIUM	{mean,missing-value,algebra}
cmk37a6wj00qhu2l7ykjew0aw	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 8, 11, 14, x, 20. If the median is 14, find a possible value for x.	14 or greater	DATA_ANALYSIS	MEDIUM	{median,missing-value}
cmk37a6wj00qiu2l7emkpjnjp	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 11, 22, 33, 44, 55, 66	38.5	DATA_ANALYSIS	MEDIUM	{mean,six-values,decimal}
cmk37a6wj00qju2l76kw8bs4n	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Which is larger: the mean or median of 9, 11, 13, 15, 87?	mean	DATA_ANALYSIS	MEDIUM	{compare,mean-median,outlier}
cmk37a6wj00qku2l7k5zdxupf	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean and median of: 10, 20, 30, 40. Are they equal?	Both are 25	DATA_ANALYSIS	MEDIUM	{mean,median,compare,equal}
cmk37a6wj00qlu2l7t9cua58p	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Monthly rainfall (mm): 30, 45, 60, 75, 90. What is the range?	60 mm	DATA_ANALYSIS	MEDIUM	{range,context,measurement}
cmk37a6wj00qmu2l7vhfp5bdk	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 9, 20, 31, 42, 53, 64	36.5	DATA_ANALYSIS	MEDIUM	{mean,six-values,decimal}
cmk37a6wk00qnu2l76e7q12pv	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 10, 22, 34, 46, 58, 70	40	DATA_ANALYSIS	MEDIUM	{median,even-count,six-values}
cmk37a6wk00qou2l7f9t7y65e	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 12, 12, 13, 14, 15, 15, 15, 16	15	DATA_ANALYSIS	MEDIUM	{mode,eight-values}
cmk37a6wk00qpu2l7mw7vsodq	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 33, 46, 59, 72, 85, 98	65	DATA_ANALYSIS	MEDIUM	{range,six-values}
cmk37a6wk00qqu2l7c6ja5crg	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 24, 28, 32, x, 40. If the mean is 32, find x.	36	DATA_ANALYSIS	MEDIUM	{mean,missing-value,algebra}
cmk37a6wk00qru2l71g9eejxj	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 9, 12, 15, x, 21. If the median is 15, find a possible value for x.	15 or greater	DATA_ANALYSIS	MEDIUM	{median,missing-value}
cmk37a6wk00qsu2l731ucb1ti	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 12, 24, 36, 48, 60, 72	42	DATA_ANALYSIS	MEDIUM	{mean,six-values}
cmk37a6wk00qtu2l7y3azrrbu	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Which is larger: the mean or median of 10, 12, 14, 16, 98?	mean	DATA_ANALYSIS	MEDIUM	{compare,mean-median,outlier}
cmk37a6wk00quu2l7thx9vsl8	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean and median of: 11, 22, 33, 44. Are they equal?	Both are 27.5	DATA_ANALYSIS	MEDIUM	{mean,median,compare,equal}
cmk37a6wk00qvu2l7qioc8i8g	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Student absences per week: 2, 4, 6, 8, 10. What is the range?	8	DATA_ANALYSIS	MEDIUM	{range,context}
cmk37a6wk00qwu2l7r9wyozg5	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 10, 22, 34, 46, 58, 70	40	DATA_ANALYSIS	MEDIUM	{mean,six-values}
cmk37a6wk00qxu2l7y6hmlsse	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 11, 24, 37, 50, 63, 76	43.5	DATA_ANALYSIS	MEDIUM	{median,even-count,six-values,decimal}
cmk37a6wk00qyu2l7s08b4omj	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 13, 13, 14, 15, 16, 16, 16, 17	16	DATA_ANALYSIS	MEDIUM	{mode,eight-values}
cmk37a6wk00qzu2l76u2g6zz7	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 36, 50, 64, 78, 92, 106	70	DATA_ANALYSIS	MEDIUM	{range,six-values}
cmk37a6wk00r0u2l7p7nsth2u	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 26, 30, 34, x, 42. If the mean is 34, find x.	38	DATA_ANALYSIS	MEDIUM	{mean,missing-value,algebra}
cmk37a6wk00r1u2l780iuw9o6	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 10, 13, 16, x, 22. If the median is 16, find a possible value for x.	16 or greater	DATA_ANALYSIS	MEDIUM	{median,missing-value}
cmk37a6wk00r2u2l70l8h7zzi	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 13, 26, 39, 52, 65, 78	45.5	DATA_ANALYSIS	MEDIUM	{mean,six-values,decimal}
cmk37a6wk00r3u2l7bgch6xqi	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Which is larger: the mean or median of 11, 13, 15, 17, 109?	mean	DATA_ANALYSIS	MEDIUM	{compare,mean-median,outlier}
cmk37a6wk00r4u2l76t1j7sgi	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean and median of: 12, 24, 36, 48. Are they equal?	Both are 30	DATA_ANALYSIS	MEDIUM	{mean,median,compare,equal}
cmk37a6wk00r5u2l7ubu13o0m	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Product prices: $15, $25, $35, $45, $55. What is the range?	$40	DATA_ANALYSIS	MEDIUM	{range,context,money}
d7dbeffc-fd6e-41e4-8339-d117e409a2e7	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−8) × (−6) × 10	480	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
ad9b5bd5-cf24-4e0f-858a-58491bb8329a	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−7) × 4 × (−6)	168	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
b221b821-7ea4-4c28-a083-6cfe2a6698c5	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−12) × 12	−144	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6wk00r7u2l75yr0uhv6	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 12, 26, 40, 54, 68, 82	47	DATA_ANALYSIS	MEDIUM	{median,even-count,six-values}
cmk37a6wk00r8u2l7nudmj1m0	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mode of: 14, 14, 15, 16, 17, 17, 17, 18	17	DATA_ANALYSIS	MEDIUM	{mode,eight-values}
cmk37a6wk00r9u2l7tr1piwqy	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 39, 54, 69, 84, 99, 114	75	DATA_ANALYSIS	MEDIUM	{range,six-values}
cmk37a6wk00rau2l7b77h1kum	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 28, 32, 36, x, 44. If the mean is 36, find x.	40	DATA_ANALYSIS	MEDIUM	{mean,missing-value,algebra}
cmk37a6wk00rbu2l7i7xspz6a	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 11, 14, 17, x, 23. If the median is 17, find a possible value for x.	17 or greater	DATA_ANALYSIS	MEDIUM	{median,missing-value}
cmk37a6wk00rcu2l769ant0xq	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 14, 28, 42, 56, 70, 84	49	DATA_ANALYSIS	MEDIUM	{mean,six-values}
cmk37a6wk00rdu2l7927juar3	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Which is larger: the mean or median of 12, 14, 16, 18, 120?	mean	DATA_ANALYSIS	MEDIUM	{compare,mean-median,outlier}
cmk37a6wk00reu2l7q7o8mmf4	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean and median of: 13, 26, 39, 52. Are they equal?	Both are 32.5	DATA_ANALYSIS	MEDIUM	{mean,median,compare,equal}
cmk37a6wk00rfu2l7oo5e6gel	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Hours of study per day: 1, 2, 3, 4, 5. What is the range?	4	DATA_ANALYSIS	MEDIUM	{range,context}
cmk37a6wk00rgu2l7twcjtcpb	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Two datasets have the same mean of 35. Dataset A has range 25, Dataset B has range 70. Which is more spread out?	B	DATA_ANALYSIS	HARD	{range,spread,compare}
cmk37a6wk00rhu2l7kwupi9fj	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A group has 6 members with mean age 30. A 7th person joins with age 44. What is the new mean?	32	DATA_ANALYSIS	HARD	{mean,adding-value,context}
cmk37a6wk00riu2l7qad5bwso	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset: 16, 24, 32, 40, 48. If each value increases by 8, what happens to the range?	stays the same	DATA_ANALYSIS	HARD	{range,transformation,constant-add}
cmk37a6wk00rju2l7zqrqb76h	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Survey scores: 75, 85, 90, 95, 100, 105. One person improves from 75 to 95. How does the median change?	increases by 2.5	DATA_ANALYSIS	HARD	{median,change,context}
cmk37a6wk00rku2l7d99x8zr7	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Dataset: 8, 16, 24, 32, 160. Why is the mean much larger than the median?	outlier (160)	DATA_ANALYSIS	HARD	{mean,median,outlier,explain}
cmk37a6wk00rlu2l7a07fmf4x	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has mean 26 and contains: 20, 22, x, 28, 30. Find x.	30	DATA_ANALYSIS	HARD	{mean,missing-value,algebra}
cmk37a6wk00rmu2l7ksd307uc	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has median 40 and contains five values. The first three are 30, 35, 40. What could the other two values be?	Any values ≥ 40	DATA_ANALYSIS	HARD	{median,missing-value,reasoning}
cmk37a6wk00rnu2l7v7kh430g	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Dataset A: 10, 20, 30, 40, 50. Dataset B: 20, 22, 30, 38, 40. Which has the larger range?	A	DATA_ANALYSIS	HARD	{range,compare,two-datasets}
cmk37a6wk00rou2l7vknhlukz	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 16, 24, 32, 40, 48. If one value is changed to 80, how does the mean change?	increases by 6.4	DATA_ANALYSIS	HARD	{mean,change,outlier-effect}
cmk37a6wk00rpu2l7x280flf4	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	The median of 12, 14, x, 20, 22 is 18. Find x.	18	DATA_ANALYSIS	HARD	{median,missing-value,algebra}
cmk37a6wk00rqu2l7aleys7v2	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has mean 28 and contains: 22, 24, x, 30, 32. Find x.	32	DATA_ANALYSIS	HARD	{mean,missing-value,algebra}
cmk37a6wk00rru2l7x7auygl3	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	The median of 13, 15, x, 21, 23 is 19. Find x.	19	DATA_ANALYSIS	HARD	{median,missing-value,algebra}
cmk37a6wz00rsu2l7gs8q9zt6	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 + 0.3	0.8	DECIMALS_ADDITION	EASY	{one-decimal-place}
cmk37a6wz00rtu2l7zjbb1ouo	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.6 + 0.2	0.8	DECIMALS_ADDITION	EASY	{one-decimal-place}
cmk37a6wz00ruu2l7bbeo8gfn	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.7 + 0.4	1.1	DECIMALS_ADDITION	EASY	{one-decimal-place,carry}
cmk37a6wz00rvu2l7gm7nv5ic	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.9 + 0.5	1.4	DECIMALS_ADDITION	EASY	{one-decimal-place,carry}
cmk37a6wz00rwu2l7kdiqnu30	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.8 + 0.6	1.4	DECIMALS_ADDITION	EASY	{one-decimal-place,carry}
cmk37a6wz00rxu2l7ty7d5vdk	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.2 + 0.5	1.7	DECIMALS_ADDITION	EASY	{one-decimal-place}
cmk37a6wz00ryu2l7v92hz8s6	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.3 + 1.4	3.7	DECIMALS_ADDITION	EASY	{one-decimal-place}
cmk37a6wz00rzu2l7dwivqiqy	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.5 + 2.8	6.3	DECIMALS_ADDITION	EASY	{one-decimal-place}
cmk37a6wz00s0u2l7eywnasen	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.7 + 1.9	6.6	DECIMALS_ADDITION	EASY	{one-decimal-place,carry}
cmk37a6wz00s1u2l7o7xebhmp	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5.6 + 3.7	9.3	DECIMALS_ADDITION	EASY	{one-decimal-place,carry}
cmk37a6wz00s2u2l7rho7irki	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.25 + 0.15	0.4	DECIMALS_ADDITION	EASY	{two-decimal-places}
cmk37a6wz00s3u2l7r8ul69fa	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.35 + 0.25	0.6	DECIMALS_ADDITION	EASY	{two-decimal-places}
cmk37a6wz00s4u2l7pm7qbk16	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.45 + 0.35	0.8	DECIMALS_ADDITION	EASY	{two-decimal-places}
cmk37a6wz00s5u2l7nlfakgou	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.55 + 0.45	1	DECIMALS_ADDITION	EASY	{two-decimal-places,whole-number-result}
cmk37a6wz00s6u2l74mcd7nhx	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.65 + 0.55	1.2	DECIMALS_ADDITION	EASY	{two-decimal-places,carry}
a1778638-b2a6-4751-9051-c5bf78f388b7	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	25 × (−4)	−100	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
976ad7cf-3f7c-44e7-82e9-97df152c1d5c	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−18) × 6	−108	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
726a5aea-ac03-4d02-a5c6-9bbabe03dee4	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	14 × (−7)	−98	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6wz00s8u2l7l0o9sm6g	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.5 + 1.25	3.75	DECIMALS_ADDITION	EASY	{mixed-decimal-places}
cmk37a6wz00s9u2l776yqsmgp	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.75 + 1.5	5.25	DECIMALS_ADDITION	EASY	{mixed-decimal-places}
cmk37a6wz00sau2l7vuck21tk	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.5 + 2.75	7.25	DECIMALS_ADDITION	EASY	{mixed-decimal-places}
cmk37a6wz00sbu2l7dmk8n7sm	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5.25 + 3.5	8.75	DECIMALS_ADDITION	EASY	{mixed-decimal-places}
cmk37a6wz00scu2l7ckpikv1r	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3 + 0.5	3.5	DECIMALS_ADDITION	EASY	{whole-plus-decimal}
cmk37a6wz00sdu2l7wvx17b1o	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5 + 0.75	5.75	DECIMALS_ADDITION	EASY	{whole-plus-decimal}
cmk37a6wz00seu2l7qjt937w5	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	7 + 0.25	7.25	DECIMALS_ADDITION	EASY	{whole-plus-decimal}
cmk37a6wz00sfu2l7efnn517b	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	10 + 0.6	10.6	DECIMALS_ADDITION	EASY	{whole-plus-decimal}
cmk37a6wz00sgu2l7hlfx3y7d	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	12 + 0.85	12.85	DECIMALS_ADDITION	EASY	{whole-plus-decimal}
cmk37a6wz00shu2l75tbz9w2v	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.1 + 0.2	0.3	DECIMALS_ADDITION	EASY	{one-decimal-place,tenths}
cmk37a6wz00siu2l7qxot7v52	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.3 + 0.4	0.7	DECIMALS_ADDITION	EASY	{one-decimal-place,tenths}
cmk37a6wz00sju2l7l3jn45ka	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.4 + 0.5	0.9	DECIMALS_ADDITION	EASY	{one-decimal-place,tenths}
cmk37a6wz00sku2l7q05htzca	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.6 + 0.7	1.3	DECIMALS_ADDITION	EASY	{one-decimal-place,tenths,carry}
cmk37a6wz00slu2l7wi0tdt35	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.8 + 0.9	1.7	DECIMALS_ADDITION	EASY	{one-decimal-place,tenths,carry}
cmk37a6wz00smu2l7anz0xlwt	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.5 + 2.5	4	DECIMALS_ADDITION	EASY	{one-decimal-place,whole-number-result}
cmk37a6wz00snu2l7iaawtd0l	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.5 + 3.5	6	DECIMALS_ADDITION	EASY	{one-decimal-place,whole-number-result}
cmk37a6wz00sou2l7dczt4j23	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.5 + 4.5	8	DECIMALS_ADDITION	EASY	{one-decimal-place,whole-number-result}
cmk37a6wz00spu2l7h2uoc2xf	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.5 + 5.5	10	DECIMALS_ADDITION	EASY	{one-decimal-place,whole-number-result}
cmk37a6wz00squ2l7k9t4veh0	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	6.5 + 7.5	14	DECIMALS_ADDITION	EASY	{one-decimal-place,whole-number-result}
cmk37a6wz00sru2l7arldelj2	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.12 + 0.34	0.46	DECIMALS_ADDITION	EASY	{two-decimal-places,hundredths}
cmk37a6wz00ssu2l7i9ob9nio	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.23 + 0.45	0.68	DECIMALS_ADDITION	EASY	{two-decimal-places,hundredths}
cmk37a6wz00stu2l7knca1gd8	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.56 + 0.23	0.79	DECIMALS_ADDITION	EASY	{two-decimal-places,hundredths}
cmk37a6wz00suu2l7torgwdim	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.67 + 0.18	0.85	DECIMALS_ADDITION	EASY	{two-decimal-places,hundredths}
cmk37a6wz00svu2l7ah6wh0wh	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.78 + 0.19	0.97	DECIMALS_ADDITION	EASY	{two-decimal-places,hundredths}
cmk37a6wz00swu2l7kvpvu2xn	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.2 + 3.4	4.6	DECIMALS_ADDITION	EASY	{one-decimal-place}
cmk37a6wz00sxu2l74158y7er	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.3 + 4.5	6.8	DECIMALS_ADDITION	EASY	{one-decimal-place}
cmk37a6wz00syu2l783hsxn9u	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.4 + 5.6	9	DECIMALS_ADDITION	EASY	{one-decimal-place,whole-number-result}
cmk37a6wz00szu2l7v90nknq7	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.6 + 6.7	11.3	DECIMALS_ADDITION	EASY	{one-decimal-place,carry}
cmk37a6wz00t0u2l70vay1v4h	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5.8 + 7.9	13.7	DECIMALS_ADDITION	EASY	{one-decimal-place,carry}
cmk37a6wz00t1u2l7aclc46v1	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	6.7 + 8.5	15.2	DECIMALS_ADDITION	EASY	{one-decimal-place,carry}
cmk37a6wz00t2u2l7dxdk2aiq	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	7.9 + 9.3	17.2	DECIMALS_ADDITION	EASY	{one-decimal-place,carry}
cmk37a6wz00t3u2l77de0xasj	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	8.4 + 10.6	19	DECIMALS_ADDITION	EASY	{one-decimal-place,whole-number-result}
cmk37a6wz00t4u2l7sl04nxmi	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	9.5 + 11.7	21.2	DECIMALS_ADDITION	EASY	{one-decimal-place,carry}
cmk37a6wz00t5u2l70iqgml1r	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	10.8 + 12.9	23.7	DECIMALS_ADDITION	EASY	{one-decimal-place,carry}
cmk37a6wz00t6u2l75aogyhwu	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.8 - 0.3	0.5	DECIMALS_SUBTRACTION	EASY	{one-decimal-place}
cmk37a6wz00t7u2l7n4boot58	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.9 - 0.4	0.5	DECIMALS_SUBTRACTION	EASY	{one-decimal-place}
cmk37a6wz00t8u2l7w2j65jwt	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.7 - 0.2	0.5	DECIMALS_SUBTRACTION	EASY	{one-decimal-place}
cmk37a6wz00t9u2l7h1poankc	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.2 - 0.5	0.7	DECIMALS_SUBTRACTION	EASY	{one-decimal-place}
cmk37a6wz00tau2l7fn7hn9tj	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.5 - 0.8	0.7	DECIMALS_SUBTRACTION	EASY	{one-decimal-place}
cmk37a6wz00tbu2l7v4aq61da	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.4 - 1.2	1.2	DECIMALS_SUBTRACTION	EASY	{one-decimal-place}
cmk37a6wz00tcu2l7qpsqjhmt	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.7 - 2.3	1.4	DECIMALS_SUBTRACTION	EASY	{one-decimal-place}
cmk37a6wz00tdu2l7vknyibl3	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.9 - 1.5	3.4	DECIMALS_SUBTRACTION	EASY	{one-decimal-place}
cmk37a6wz00teu2l7ke0w29ue	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5.6 - 2.8	2.8	DECIMALS_SUBTRACTION	EASY	{one-decimal-place}
cmk37a6wz00tfu2l7itwkffbf	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	6.3 - 3.7	2.6	DECIMALS_SUBTRACTION	EASY	{one-decimal-place,borrow}
1c1b02ac-be90-464b-be7a-728e407fa749	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−16) × 8	−128	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
465241cd-a7fe-4ab1-abad-910be2efa010	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	19 × (−5)	−95	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
bc951ace-b0ba-48a2-bae5-068eced68d29	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−13) × 9	−117	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6wz00thu2l77yumwh12	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.85 - 0.35	0.5	DECIMALS_SUBTRACTION	EASY	{two-decimal-places}
cmk37a6wz00tiu2l7mkiu81yo	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.95 - 0.45	0.5	DECIMALS_SUBTRACTION	EASY	{two-decimal-places}
cmk37a6wz00tju2l7108oh6gi	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.5 - 0.75	0.75	DECIMALS_SUBTRACTION	EASY	{mixed-decimal-places}
cmk37a6wz00tku2l77r8nrdyh	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.25 - 1.5	0.75	DECIMALS_SUBTRACTION	EASY	{mixed-decimal-places}
cmk37a6wz00tlu2l782icg6ip	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.75 - 2.5	1.25	DECIMALS_SUBTRACTION	EASY	{mixed-decimal-places}
cmk37a6wz00tmu2l7ignpw4hd	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.5 - 1.75	2.75	DECIMALS_SUBTRACTION	EASY	{mixed-decimal-places}
cmk37a6wz00tnu2l7pen4yjkn	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5.25 - 3.5	1.75	DECIMALS_SUBTRACTION	EASY	{mixed-decimal-places}
cmk37a6wz00tou2l7by89oxws	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	6.5 - 4.25	2.25	DECIMALS_SUBTRACTION	EASY	{mixed-decimal-places}
cmk37a6wz00tpu2l7dky2lw6s	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	7.75 - 5.5	2.25	DECIMALS_SUBTRACTION	EASY	{mixed-decimal-places}
cmk37a6wz00tqu2l7t6r8a5nu	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5 - 0.5	4.5	DECIMALS_SUBTRACTION	EASY	{whole-minus-decimal}
cmk37a6wz00tru2l7sgj67lt1	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	7 - 0.25	6.75	DECIMALS_SUBTRACTION	EASY	{whole-minus-decimal}
cmk37a6wz00tsu2l71gn3go5i	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	10 - 0.75	9.25	DECIMALS_SUBTRACTION	EASY	{whole-minus-decimal}
cmk37a6wz00ttu2l7ze3g1d8l	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	12 - 0.6	11.4	DECIMALS_SUBTRACTION	EASY	{whole-minus-decimal}
cmk37a6wz00tuu2l7bwu9yoc8	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	15 - 0.85	14.15	DECIMALS_SUBTRACTION	EASY	{whole-minus-decimal}
cmk37a6wz00tvu2l7xr9om787	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.9 - 0.1	0.8	DECIMALS_SUBTRACTION	EASY	{one-decimal-place,tenths}
cmk37a6wz00twu2l7g9330n3f	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.8 - 0.3	0.5	DECIMALS_SUBTRACTION	EASY	{one-decimal-place,tenths}
cmk37a6wz00txu2l7qqd7xnqr	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.7 - 0.4	0.3	DECIMALS_SUBTRACTION	EASY	{one-decimal-place,tenths}
cmk37a6wz00tyu2l7k74gukkv	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.3 - 0.6	0.7	DECIMALS_SUBTRACTION	EASY	{one-decimal-place,tenths,borrow}
cmk37a6wz00tzu2l7pmvh98a5	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.7 - 0.9	0.8	DECIMALS_SUBTRACTION	EASY	{one-decimal-place,tenths,borrow}
cmk37a6wz00u0u2l7yqjk7n3x	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4 - 1.5	2.5	DECIMALS_SUBTRACTION	EASY	{whole-minus-decimal}
cmk37a6wz00u1u2l72gtbx1w8	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	6 - 2.5	3.5	DECIMALS_SUBTRACTION	EASY	{whole-minus-decimal}
cmk37a6wz00u2u2l7ifyaga6d	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	8 - 3.5	4.5	DECIMALS_SUBTRACTION	EASY	{whole-minus-decimal}
cmk37a6wz00u3u2l72wub38aj	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	10 - 4.5	5.5	DECIMALS_SUBTRACTION	EASY	{whole-minus-decimal}
cmk37a6wz00u4u2l7mtl543os	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	14 - 6.5	7.5	DECIMALS_SUBTRACTION	EASY	{whole-minus-decimal}
cmk37a6wz00u5u2l7q7jxl9pe	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.89 - 0.34	0.55	DECIMALS_SUBTRACTION	EASY	{two-decimal-places,hundredths}
cmk37a6wz00u6u2l718942k6x	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.78 - 0.23	0.55	DECIMALS_SUBTRACTION	EASY	{two-decimal-places,hundredths}
cmk37a6wz00u7u2l7vtpqrb03	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.97 - 0.45	0.52	DECIMALS_SUBTRACTION	EASY	{two-decimal-places,hundredths}
cmk37a6wz00u8u2l7yjv189ct	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.86 - 0.18	0.68	DECIMALS_SUBTRACTION	EASY	{two-decimal-places,hundredths}
cmk37a6wz00u9u2l7lqlehutv	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.95 - 0.67	0.28	DECIMALS_SUBTRACTION	EASY	{two-decimal-places,hundredths}
cmk37a6wz00uau2l78r6gkeh2	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.6 - 1.2	3.4	DECIMALS_SUBTRACTION	EASY	{one-decimal-place}
cmk37a6wz00ubu2l7aghgppxc	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	6.8 - 2.3	4.5	DECIMALS_SUBTRACTION	EASY	{one-decimal-place}
cmk37a6wz00ucu2l7378biivs	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	9 - 3.4	5.6	DECIMALS_SUBTRACTION	EASY	{whole-minus-decimal}
cmk37a6wz00udu2l7p5tp18vv	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	11.3 - 4.6	6.7	DECIMALS_SUBTRACTION	EASY	{one-decimal-place,borrow}
cmk37a6wz00ueu2l7xbijqp34	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	13.7 - 5.8	7.9	DECIMALS_SUBTRACTION	EASY	{one-decimal-place,borrow}
cmk37a6wz00ufu2l7aefzt9rs	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	15.2 - 6.7	8.5	DECIMALS_SUBTRACTION	EASY	{one-decimal-place,borrow}
cmk37a6wz00ugu2l7u6jdwm2s	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	17.2 - 7.9	9.3	DECIMALS_SUBTRACTION	EASY	{one-decimal-place,borrow}
cmk37a6x000uhu2l7p9cs03k5	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	19 - 8.4	10.6	DECIMALS_SUBTRACTION	EASY	{whole-minus-decimal}
cmk37a6x000uiu2l7aamcsy2n	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	21.2 - 9.5	11.7	DECIMALS_SUBTRACTION	EASY	{one-decimal-place,borrow}
cmk37a6x000uju2l7rqzpl2fd	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	23.7 - 10.8	12.9	DECIMALS_SUBTRACTION	EASY	{one-decimal-place,borrow}
cmk37a6x000uku2l7t2kqixof	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 × 2	1	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000ulu2l7grxjpqz8	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 × 4	2	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000umu2l7sjghvxgh	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 × 6	3	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000unu2l7b4pcy8ls	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 × 8	4	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000uou2l7xpma2j23	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 × 10	5	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000upu2l702h160vm	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.25 × 4	1	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
a12e32a0-a415-40d2-b1fd-035fbc383599	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	22 × (−6)	−132	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
795cf351-3902-48de-9354-1f20f537786a	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−17) × 7	−119	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
1e69c866-9787-4852-ad8a-903d8172e1ea	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	24 × (−3)	−72	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6x000usu2l7gqknmzhd	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.75 × 4	3	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000utu2l7ahtih28q	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.75 × 8	6	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000uuu2l7jg6aqg9e	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2 × 0.3	0.6	DECIMALS_MULTIPLICATION	MEDIUM	{whole-times-decimal}
cmk37a6x000uvu2l76rymkcdq	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3 × 0.4	1.2	DECIMALS_MULTIPLICATION	MEDIUM	{whole-times-decimal}
cmk37a6x000uwu2l7iith3uco	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4 × 0.5	2	DECIMALS_MULTIPLICATION	MEDIUM	{whole-times-decimal}
cmk37a6x000uxu2l7j3uy6e7b	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5 × 0.6	3	DECIMALS_MULTIPLICATION	MEDIUM	{whole-times-decimal}
cmk37a6x000uyu2l7ioatktri	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	6 × 0.7	4.2	DECIMALS_MULTIPLICATION	MEDIUM	{whole-times-decimal}
cmk37a6x000uzu2l7g8x7orit	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.2 × 0.5	0.1	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000v0u2l774w738em	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.3 × 0.4	0.12	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000v1u2l7x7j9p52j	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.4 × 0.5	0.2	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000v2u2l76ev4juc4	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 × 0.6	0.3	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000v3u2l7kz6wif7z	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.6 × 0.7	0.42	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000v4u2l7c1ykj7x7	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.7 × 0.8	0.56	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000v5u2l7ffp06s5b	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.8 × 0.9	0.72	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000v6u2l7ry4b0hs0	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.9 × 0.5	0.45	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000v7u2l7h5rsvscw	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.2 × 3	3.6	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000v8u2l73hkbiho1	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.3 × 2	4.6	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000v9u2l74fwerxez	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.4 × 2	6.8	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000vau2l7outtx63a	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.5 × 2	9	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000vbu2l789hz50h6	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5.6 × 3	16.8	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000vcu2l7i0hxeb2b	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.1 × 10	1	DECIMALS_MULTIPLICATION	MEDIUM	{multiply-by-10}
cmk37a6x000vdu2l7fa815xw6	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.2 × 10	2	DECIMALS_MULTIPLICATION	MEDIUM	{multiply-by-10}
cmk37a6x000veu2l7ywj5bfwo	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.3 × 10	3	DECIMALS_MULTIPLICATION	MEDIUM	{multiply-by-10}
cmk37a6x000vfu2l7rz0hm1ba	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 × 10	5	DECIMALS_MULTIPLICATION	MEDIUM	{multiply-by-10}
cmk37a6x000vgu2l7kn3oxoz1	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.75 × 10	7.5	DECIMALS_MULTIPLICATION	MEDIUM	{multiply-by-10}
cmk37a6x000vhu2l7o8ioxqlz	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.5 × 4	6	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000viu2l70t6opb0i	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.5 × 3	7.5	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000vju2l7z7zb0yn3	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.5 × 2	7	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000vku2l7qso4bbf6	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.5 × 4	18	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000vlu2l7iuc2kgdr	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	6.5 × 2	13	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000vmu2l7b85mijzq	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.2 × 0.5	0.6	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000vnu2l7s9mz5qmr	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.5 × 0.4	0.6	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000vou2l7og02prep	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.5 × 0.2	0.5	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000vpu2l7ggyiojrt	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.5 × 0.2	0.7	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000vqu2l7wkl4rxwk	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.5 × 0.2	0.9	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000vru2l77qcv7uvd	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.1 × 0.1	0.01	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal,small-product}
cmk37a6x000vsu2l7nqp97mio	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.2 × 0.2	0.04	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal,small-product}
cmk37a6x000vtu2l78xwn9tnn	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.3 × 0.3	0.09	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal,small-product}
cmk37a6x000vuu2l7obws4rok	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 × 0.5	0.25	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-decimal}
cmk37a6x000vvu2l784zjc0xp	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	7 × 0.8	5.6	DECIMALS_MULTIPLICATION	MEDIUM	{whole-times-decimal}
cmk37a6x000vwu2l7v8u2d2lw	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	8 × 0.9	7.2	DECIMALS_MULTIPLICATION	MEDIUM	{whole-times-decimal}
cmk37a6x000vxu2l7qg18lmdn	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	9 × 0.6	5.4	DECIMALS_MULTIPLICATION	MEDIUM	{whole-times-decimal}
cmk37a6x000vyu2l7312rmm73	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1 ÷ 2	0.5	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000vzu2l7l10efv5h	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1 ÷ 4	0.25	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000w0u2l79iek1qnx	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3 ÷ 4	0.75	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000w1u2l702kgvvy9	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1 ÷ 5	0.2	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
0d1bb94b-de14-4839-9656-6aaafcd57bf4	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−21) × 4	−84	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
6d6389da-48e7-4697-a9bf-4ff2bb573ec8	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−8) × (−9)	72	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
3fad0e9b-3884-467d-907f-277fd0db47c4	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−7) × (−8)	56	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
ea6be6bb-806b-405d-bdc8-1619834d27cf	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−12) × (−11)	132	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6x000w3u2l7bdcezupf	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3 ÷ 5	0.6	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000w4u2l7sfg34alr	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4 ÷ 5	0.8	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000w5u2l72kxl0k14	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1 ÷ 10	0.1	DECIMALS_DIVISION	MEDIUM	{divide-by-10}
cmk37a6x000w6u2l7qx6bc6g8	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2 ÷ 10	0.2	DECIMALS_DIVISION	MEDIUM	{divide-by-10}
cmk37a6x000w7u2l7y19wq7l1	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3 ÷ 10	0.3	DECIMALS_DIVISION	MEDIUM	{divide-by-10}
cmk37a6x000w8u2l7mn3rs2mi	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5 ÷ 10	0.5	DECIMALS_DIVISION	MEDIUM	{divide-by-10}
cmk37a6x000w9u2l7glwvfgiy	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	7.5 ÷ 10	0.75	DECIMALS_DIVISION	MEDIUM	{divide-by-10}
cmk37a6x000wau2l73khuu8mt	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.6 ÷ 2	0.3	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000wbu2l7paw8zvi6	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.8 ÷ 2	0.4	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000wcu2l75jjwody7	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.2 ÷ 2	0.6	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000wdu2l7y7jga9p2	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.5 ÷ 3	0.5	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000weu2l762mvfuzv	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.8 ÷ 3	0.6	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000wfu2l7wuhormxy	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.4 ÷ 4	0.6	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000wgu2l768h6gvlq	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.6 ÷ 4	0.9	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000whu2l7kipn9c13	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.8 ÷ 6	0.8	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000wiu2l7yb0659jh	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.6 ÷ 0.2	3	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000wju2l749vup3hx	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.8 ÷ 0.4	2	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000wku2l72md3bgsj	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.2 ÷ 0.4	3	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000wlu2l78n7ygayz	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.5 ÷ 0.5	3	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000wmu2l7wsvamzzm	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.4 ÷ 0.6	4	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000wnu2l7m8osvpr3	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.6 ÷ 0.6	6	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000wou2l7fxvyokn4	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.8 ÷ 0.8	6	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000wpu2l74896xb8c	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	6 ÷ 2	3	DECIMALS_DIVISION	MEDIUM	{whole-div-whole}
cmk37a6x000wqu2l71lv77deg	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	7.5 ÷ 3	2.5	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000wru2l75gl58hng	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	9 ÷ 4	2.25	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000wsu2l7v4gtvr9l	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	6.8 ÷ 2	3.4	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000wtu2l73cxwpgmg	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	9 ÷ 2	4.5	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000wuu2l7gqfjd29p	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	16.8 ÷ 3	5.6	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000wvu2l7fki86rwi	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	18 ÷ 4	4.5	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000wwu2l71foprtgs	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	13 ÷ 2	6.5	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000wxu2l75ammk39w	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.1 ÷ 0.1	1	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000wyu2l77bdr4bup	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.2 ÷ 0.1	2	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000wzu2l7lnx4dody	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.3 ÷ 0.1	3	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000x0u2l7x9sgq27q	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 ÷ 0.1	5	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000x1u2l7dsfrx7vi	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.9 ÷ 0.3	3	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000x2u2l71wufcfk1	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5 ÷ 2	2.5	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000x3u2l7e77eak3d	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	7 ÷ 2	3.5	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000x4u2l7m6qcj285	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	11 ÷ 4	2.75	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000x5u2l7bd7t6p8s	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	15 ÷ 4	3.75	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a6x000x6u2l7nywqidgs	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.04 ÷ 0.2	0.2	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000x7u2l7jzdaqyyt	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.09 ÷ 0.3	0.3	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000x8u2l777mvm1af	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.25 ÷ 0.5	0.5	DECIMALS_DIVISION	MEDIUM	{decimal-div-decimal}
cmk37a6x000x9u2l7iukzc5gj	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5.6 ÷ 7	0.8	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000xau2l7jofrprh0	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	7.2 ÷ 8	0.9	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000xbu2l7is9ysop8	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	5.4 ÷ 9	0.6	DECIMALS_DIVISION	MEDIUM	{decimal-div-whole}
cmk37a6x000xcu2l7y5o7ng3p	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 + 0.3 × 2	1.1	DECIMALS_ADDITION	HARD	{mixed-operations,order-of-operations}
918a6e63-c8c1-4d05-b718-37abcac46967	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−4) × (−25)	100	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
7a8b83e3-71e9-4184-b0ff-233dd64f190c	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−6) × (−15)	90	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
e176bdf3-ce84-4572-896c-5659eaa2380f	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	17 × (−8)	−136	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6x000xeu2l7r7rejhlk	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.4 ÷ 2 + 0.6	1.8	DECIMALS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6x000xfu2l71r9kbk9m	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.6 ÷ 3 - 0.2	1	DECIMALS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6x000xgu2l714df5as1	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.8 × 2 + 0.4	2	DECIMALS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6x000xhu2l76szxy3bm	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(0.5 + 0.3) × 2	1.6	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x000xiu2l7q77rrwwm	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(1.2 - 0.4) × 3	2.4	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x000xju2l7zyxgmjrx	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(2.4 + 0.6) ÷ 2	1.5	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x000xku2l7hyvc9mnc	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(3.6 - 1.2) ÷ 4	0.6	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x000xlu2l7tvsewncz	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(1.5 + 2.5) × 0.5	2	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x000xmu2l76qt8q9n6	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.5 + 0.4 × 3 - 0.3	2.4	DECIMALS_ADDITION	HARD	{mixed-operations,three-operations}
cmk37a6x000xnu2l73qgl6o9e	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2 - 0.5 × 2 + 0.5	1.5	DECIMALS_ADDITION	HARD	{mixed-operations,three-operations}
cmk37a6x000xou2l7takikwyc	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.6 ÷ 2 + 0.4 × 3	3	DECIMALS_ADDITION	HARD	{mixed-operations,three-operations}
cmk37a6x000xpu2l7ix40it0x	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.8 ÷ 3 - 0.2 + 0.6	2	DECIMALS_ADDITION	HARD	{mixed-operations,three-operations}
cmk37a6x000xqu2l7wcc1kxfe	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.2 + 1.8 ÷ 2 - 0.3	1.8	DECIMALS_ADDITION	HARD	{mixed-operations,three-operations}
cmk37a6x000xru2l7i94909u0	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.6 × (0.5 + 1.5)	1.2	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x000xsu2l7rvkjzpls	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.6 ÷ (1.2 + 0.6)	2	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x000xtu2l70n18661z	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.8 ÷ (2.4 - 0.8)	3	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x000xuu2l7kwddzoje	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.8 × (3 - 1.5)	1.2	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x000xvu2l7vfrakfce	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	6 ÷ (2.5 + 1.5)	1.5	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x000xwu2l7j1x3tunx	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(0.8 + 0.4) × 2 - 0.6	1.8	DECIMALS_ADDITION	HARD	{mixed-operations,brackets-and-more}
cmk37a6x000xxu2l7n11k1fwh	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(1.5 - 0.3) × 2 + 0.4	2.8	DECIMALS_ADDITION	HARD	{mixed-operations,brackets-and-more}
cmk37a6x000xyu2l7kiz24xmz	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(2.4 + 1.6) ÷ 2 - 0.5	1.5	DECIMALS_ADDITION	HARD	{mixed-operations,brackets-and-more}
cmk37a6x000xzu2l7xq8nsv7p	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(3.6 - 1.2) ÷ 3 + 0.2	1	DECIMALS_ADDITION	HARD	{mixed-operations,brackets-and-more}
cmk37a6x000y0u2l7mrbh4040	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(4 + 2) × 0.5 - 1.5	1.5	DECIMALS_ADDITION	HARD	{mixed-operations,brackets-and-more}
cmk37a6x000y1u2l721goercm	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 × 4 + 0.6 × 3	3.8	DECIMALS_ADDITION	HARD	{mixed-operations,multiple-multiplications}
cmk37a6x000y2u2l7kpqtg00g	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.8 × 2 + 0.4 × 5	3.6	DECIMALS_ADDITION	HARD	{mixed-operations,multiple-multiplications}
cmk37a6x000y3u2l7pn65g87i	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.2 × 3 - 0.6 × 2	2.4	DECIMALS_ADDITION	HARD	{mixed-operations,multiple-multiplications}
cmk37a6x000y4u2l7hd9pvety	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.4 ÷ 2 + 3.6 ÷ 3	2.4	DECIMALS_ADDITION	HARD	{mixed-operations,multiple-divisions}
cmk37a6x100y5u2l7rrrf5xsn	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.8 ÷ 4 - 1.8 ÷ 3	0.6	DECIMALS_ADDITION	HARD	{mixed-operations,multiple-divisions}
cmk37a6x100y6u2l7xlvt5hq5	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.25 + 0.5 × 4	2.25	DECIMALS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6x100y7u2l7w08jg8kw	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.75 - 0.25 × 2	0.25	DECIMALS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6x100y8u2l75pwcjaon	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.5 + 2.4 ÷ 3	2.3	DECIMALS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6x100y9u2l72w06ojdm	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.5 - 1.2 ÷ 4	2.2	DECIMALS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6x100yau2l71zgxme8o	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.2 + 0.6 × 2 - 0.8	3.6	DECIMALS_ADDITION	HARD	{mixed-operations,three-operations}
cmk37a6x100ybu2l75obrxwx7	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(0.6 + 0.4) × 5	5	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x100ycu2l795vsoe6h	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(1.8 - 0.6) ÷ 2	0.6	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x100ydu2l7oi2ng5l5	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(2.5 + 1.5) ÷ 4	1	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x100yeu2l7wilm8zef	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(3.6 - 1.2) × 0.5	1.2	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x100yfu2l700y593k7	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	(5 - 2.5) ×  2	5	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x100ygu2l79vttart4	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.5 × 2 + 2.4 ÷ 3 - 0.5	3.3	DECIMALS_ADDITION	HARD	{mixed-operations,four-operations}
cmk37a6x100yhu2l7t61piucu	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3 - 0.6 × 2 + 1.8 ÷ 3	2.4	DECIMALS_ADDITION	HARD	{mixed-operations,four-operations}
cmk37a6x100yiu2l7o0pqtkj0	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	4.5 ÷ 3 + 0.5 × 4 - 0.5	3	DECIMALS_ADDITION	HARD	{mixed-operations,four-operations}
e028a5ef-d7a6-4e80-a5a0-dd17227f39e6	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−19) × 6	−114	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
c6d5452d-3264-41da-b81a-386c0f8a5f94	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	13 × (−11)	−143	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
ab14697c-63c7-4a60-8111-f92cbce426ca	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−14) × 12	−168	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6x100yku2l78zxgcq6b	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.6 - 1.2 ÷ 3 + 0.4 × 2	4	DECIMALS_ADDITION	HARD	{mixed-operations,four-operations}
cmk37a6x100ylu2l7bd17uh23	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.5 × (2.4 + 1.6)	2	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x100ymu2l7blbada9b	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.4 × (5 - 2.5)	1	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x100ynu2l7spbcmgan	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.4 ÷ (0.6 + 0.2)	3	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x100you2l7fbxp0nh6	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	3.6 ÷ (1.8 - 0.6)	3	DECIMALS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6x100ypu2l72omk2o68	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.2 × (3 - 1.5) + 0.6	2.4	DECIMALS_ADDITION	HARD	{mixed-operations,brackets-and-more}
cmk37a6xd00yqu2l7rva9ozq0	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/2 ÷ 1/3	1 1/2	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00yru2l7v488eij5	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/2 ÷ 1/4	2	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00ysu2l7qsktcrso	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/3 ÷ 1/2	2/3	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00ytu2l7bjg647ls	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/3 ÷ 1/4	1 1/3	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00yuu2l7y4ug2fwt	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/4 ÷ 1/2	1/2	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00yvu2l7inbw0sum	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/4 ÷ 1/3	3/4	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00ywu2l7se5pgfbm	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/2 ÷ 1/5	2 1/2	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00yxu2l7jb31lveg	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/5 ÷ 1/2	2/5	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00yyu2l7qj76661k	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/3 ÷ 1/6	2	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00yzu2l7kcwvemda	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/6 ÷ 1/3	1/2	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00z0u2l79r3gv9vv	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/4 ÷ 1/8	2	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00z1u2l7yxq0sfvv	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/8 ÷ 1/4	1/2	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00z2u2l73trxcywi	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2/3 ÷ 1/2	1 1/3	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00z3u2l7lif2i9fb	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3/4 ÷ 1/2	1 1/2	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00z4u2l7kcu4exad	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2/5 ÷ 1/2	4/5	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00z5u2l7naz4jbyt	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3/5 ÷ 1/2	1 1/5	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00z6u2l70h35zn0d	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	4/5 ÷ 1/2	1 3/5	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00z7u2l7ytpb0eur	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2/3 ÷ 1/3	2	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00z8u2l74r55s6ws	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2/3 ÷ 1/4	2 2/3	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00z9u2l762ldyl9s	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3/4 ÷ 1/3	2 1/4	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00zau2l7rbi1cm0z	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3/4 ÷ 1/4	3	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00zbu2l7z7jcea64	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	5/6 ÷ 1/2	1 2/3	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00zcu2l7csh0p1f5	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	5/6 ÷ 1/3	2 1/2	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00zdu2l7xmzxnn2e	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	7/8 ÷ 1/2	1 3/4	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00zeu2l72wf8fxvs	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	7/8 ÷ 1/4	3 1/2	FRACTION_DIVISION	EASY	{proper-fractions,unit-fraction-divisor}
cmk37a6xd00zfu2l7lg1wa7vj	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/2 ÷ 2/3	3/4	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zgu2l7u3ol8eju	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/2 ÷ 3/4	2/3	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zhu2l79ovvni4x	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/3 ÷ 2/3	1/2	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00ziu2l7j061jkri	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/4 ÷ 3/4	1/3	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zju2l7f8ssm841	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/2 ÷ 2/5	1 1/4	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zku2l776xmkd5y	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/3 ÷ 2/5	5/6	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zlu2l7w8vg0k6e	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/4 ÷ 2/5	5/8	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zmu2l7ue205m3o	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2/3 ÷ 4/5	5/6	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00znu2l7a41zz5yt	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3/4 ÷ 5/6	9/10	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zou2l76dqmej1q	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2/5 ÷ 3/5	2/3	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
8044b3ef-b82b-412a-a110-1b5036e05eb6	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	15 × (−9)	−135	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
113e39c3-1d21-46fc-9e11-c84a6ca0a9ad	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−5) × (−17)	85	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
08490f12-5dfa-4b32-8d63-020d2ebb9aa4	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−16) × (−6)	96	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6xd00zqu2l7odydqmdc	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	5/8 ÷ 7/8	5/7	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zru2l7u7nm0wc9	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/2 ÷ 3/8	1 1/3	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zsu2l75m36rjxm	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/3 ÷ 2/9	1 1/2	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00ztu2l7vmvksu69	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/4 ÷ 3/8	2/3	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zuu2l7jrn9zr1p	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2/3 ÷ 5/6	4/5	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zvu2l76ybb48n1	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3/4 ÷ 7/8	6/7	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zwu2l7n2t5u4ba	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3/5 ÷ 4/5	3/4	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zxu2l72bszjgv6	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	4/7 ÷ 5/7	4/5	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zyu2l7hao13uw7	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	5/9 ÷ 7/9	5/7	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd00zzu2l73k1q3nvj	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/5 ÷ 3/5	1/3	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd0100u2l7f1ut7s65	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2/7 ÷ 5/7	2/5	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd0101u2l7ii1x3f6l	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3/8 ÷ 5/8	3/5	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd0102u2l7o6xmf9bp	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	4/9 ÷ 7/9	4/7	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd0103u2l7w50sv9jx	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1/6 ÷ 5/6	1/5	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xd0104u2l7qr38qshc	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2/3 ÷ 4/9	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd0105u2l7j9rao54a	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3/4 ÷ 9/16	1 1/3	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd0106u2l7lrhsurw4	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	4/5 ÷ 8/15	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd0107u2l7ltnfue68	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	5/6 ÷ 10/9	3/4	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd0108u2l7eyrmb17k	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3/8 ÷ 9/16	2/3	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd0109u2l7727wlgz5	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	5/12 ÷ 10/9	3/8	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd010au2l7mri8lkyg	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	7/10 ÷ 14/15	3/4	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd010bu2l7l2h1gf7e	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	9/14 ÷ 3/7	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd010cu2l7umws98oj	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	5/16 ÷ 15/32	2/3	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd010du2l765oyguwq	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	11/18 ÷ 22/27	3/4	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd010eu2l7tl450jg9	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	8/21 ÷ 4/7	2/3	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd010fu2l7jq9zp5ry	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	15/22 ÷ 5/11	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd010gu2l73706cwlh	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	9/20 ÷ 3/10	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd010hu2l7rysexloz	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	14/25 ÷ 7/15	1 1/5	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd010iu2l78gpvvsw3	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	10/21 ÷ 5/14	1 1/3	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd010ju2l7ywilafu0	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	12/25 ÷ 6/35	2 4/5	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd010ku2l7pgl3rwmd	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	16/27 ÷ 8/9	2/3	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xd010lu2l7thq56bzc	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	11/24 ÷ 22/48	1	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe010mu2l783jioomt	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	18/35 ÷ 9/14	4/5	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe010nu2l706qz6kvl	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	15/28 ÷ 5/21	2 1/4	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe010ou2l7cu7xw1zt	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	20/33 ÷ 10/22	1 1/3	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe010pu2l7dtbn7k48	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	17/36 ÷ 34/72	1	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe010qu2l7hm59evaz	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	21/40 ÷ 7/20	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe010ru2l7h77g97fe	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	13/30 ÷ 26/45	3/4	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe010su2l7qklus2j4	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	22/35 ÷ 11/28	1 3/5	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe010tu2l78c78z1wq	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	19/42 ÷ 38/63	3/4	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe010uu2l7h4w140d4	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	25/36 ÷ 5/12	1 2/3	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
55d3e160-1ae4-496d-aab6-de869e9c6281	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−3) × (−24)	72	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
7fcd7c76-7f6d-46d8-b397-71afb0210a26	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−18) × (−5)	90	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
79119d5c-7b1f-444c-9221-06c19811d94b	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−2) × 5 × (−8)	80	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
cmk37a6xe010wu2l7kzhfoewe	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	27/44 ÷ 9/22	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe010xu2l72bako3lr	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	28/45 ÷ 14/27	1 1/5	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe010yu2l7jir95ruc	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	6/7 ÷ 12/35	2 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe010zu2l7cyb16b98	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	8/9 ÷ 16/27	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe0110u2l7x5l591y4	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	10/11 ÷ 20/33	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe0111u2l75i4ghaiu	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	12/13 ÷ 24/39	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe0112u2l7ba78pch4	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	9/16 ÷ 3/8	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe0113u2l7hgys8rbw	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	15/32 ÷ 5/16	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe0114u2l7manbc11b	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	21/50 ÷ 7/25	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe0115u2l77mh85xmy	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	18/49 ÷ 6/21	1 2/7	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe0116u2l7aj3q80mp	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	20/63 ÷ 10/21	2/3	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe0117u2l7aigk64ja	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	24/55 ÷ 12/33	1 1/5	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe0118u2l7yqi24msx	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	27/64 ÷ 9/32	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe0119u2l7i90x3c2r	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	30/77 ÷ 15/44	1 3/7	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe011au2l7h09zx552	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	35/72 ÷ 7/24	1 2/3	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xe011bu2l7qj21c770	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	33/80 ÷ 11/40	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xf011cu2l7rw28pvvb	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	36/91 ÷ 12/39	1 2/7	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xf011du2l7b13mu0vr	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	40/99 ÷ 20/66	1 1/3	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xf011eu2l7oqy1kyg9	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	42/95 ÷ 21/57	1 1/5	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xf011fu2l7fuxif0vq	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	4/9 ÷ 8/27	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xf011gu2l7b4t1g3en	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	7/12 ÷ 14/36	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xf011hu2l7toijtes2	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	11/15 ÷ 22/45	1 1/2	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xf011iu2l7e3prboxb	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 1/2 ÷ 2	3/4	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-whole}
cmk37a6xf011ju2l7kuier38n	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 1/3 ÷ 3	7/9	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-whole}
cmk37a6xf011ku2l7bcamnu39	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 1/4 ÷ 2	5/8	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-whole}
cmk37a6xf011lu2l7mrnre1x7	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3 1/2 ÷ 2	1 3/4	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-whole}
cmk37a6xf011mu2l7aqi0jilm	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 2/5 ÷ 3	4/5	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-whole}
cmk37a6xf011nu2l7wssv54ay	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 2/3 ÷ 2	5/6	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-whole}
cmk37a6xf011ou2l7jamjyupe	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 1/4 ÷ 3	3/4	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-whole}
cmk37a6xf011pu2l78pvqnaen	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 3/4 ÷ 2	7/8	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-whole}
cmk37a6xf011qu2l72oievheb	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3 1/3 ÷ 2	1 2/3	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-whole}
cmk37a6xf011ru2l7wmhhohkd	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 1/2 ÷ 5	1/2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-whole}
cmk37a6xf011su2l74fx2u8p6	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 1/2 ÷ 1/2	3	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf011tu2l7wdwxtyqv	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 1/3 ÷ 1/3	7	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf011uu2l7knd7cblr	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 1/4 ÷ 1/2	2 1/2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf011vu2l7x3b6hfto	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3 1/2 ÷ 1/2	7	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf011wu2l7r3bxbx22	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 2/5 ÷ 2/5	6	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf011xu2l7l1zy453i	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 2/3 ÷ 2/3	2 1/2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf011yu2l7k6mubnut	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 1/4 ÷ 3/4	3	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf011zu2l7mjkl4hsk	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 3/4 ÷ 1/4	7	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6yb019du2l7h362moi4	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√72	6√2	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
a9926e26-ec27-4443-a705-f189102ec0ab	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	3 × (−4) × (−5)	60	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
25dc5d51-266e-4e65-83b2-6611a31358c1	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−6) × (−2) × (−3)	−36	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
777f6478-8651-4163-8f41-52271400c4b3	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	4 × (−3) × 5	−60	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
cmk37a6xf0121u2l7xyqktjir	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 1/2 ÷ 3/4	3 1/3	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf0122u2l76r3xgmhn	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 1/2 ÷ 1 1/2	1	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xf0123u2l7rl6ej2tp	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 1/3 ÷ 1 1/6	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xf0124u2l7k3g4kroj	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 1/4 ÷ 5/8	2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf0125u2l7woh89art	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3 1/2 ÷ 1 3/4	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xf0126u2l7ippxpvfl	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 2/5 ÷ 1 1/5	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xf0127u2l7mo7il656	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 2/3 ÷ 5/6	2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf0128u2l7genw0z3t	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 1/4 ÷ 1 1/2	1 1/2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xf0129u2l7voujxgrn	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 3/4 ÷ 7/8	2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf012au2l7xo362it8	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3 1/3 ÷ 1 2/3	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xf012bu2l7rv30rar7	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 1/2 ÷ 1 1/4	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xf012cu2l7j87wl9pw	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 1/5 ÷ 3/5	2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf012du2l7v0os5u3z	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 2/3 ÷ 1 1/3	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xf012eu2l7ump6qmjn	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 1/6 ÷ 7/12	2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xf012fu2l7w4yfejao	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3 3/4 ÷ 1 1/2	2 1/2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xg012gu2l7fewzh05q	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 1/8 ÷ 17/24	3	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xg012hu2l79vyybcql	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 4/5 ÷ 9/10	2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xg012iu2l7ubfss4l0	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 3/5 ÷ 1 3/10	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xg012ju2l7t8rc93r2	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 1/7 ÷ 4/7	2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xg012ku2l7riggop4s	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3 2/3 ÷ 1 5/6	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xg012lu2l7ej901t5e	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 1/6 ÷ 13/18	3	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xg012mu2l79g1e87w8	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 5/6 ÷ 11/12	2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xg012nu2l74sdqpdiv	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 3/4 ÷ 1 3/8	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xg012ou2l76a56zgrh	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 2/7 ÷ 9/14	2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xg012pu2l770oahybe	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3 1/5 ÷ 1 3/5	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xg012qu2l7v7qvc3o3	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 1/9 ÷ 19/27	3	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xg012ru2l7s4ic7glv	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 3/5 ÷ 4/5	2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xg012su2l71muwehg6	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 4/5 ÷ 1 2/5	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xg012tu2l7racoj4pn	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	1 1/8 ÷ 9/16	2	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6xg012uu2l73nx7cdhe	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3 1/4 ÷ 1 5/8	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6xg012vu2l7ty3h5rfl	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	2 2/9 ÷ 1 1/9	2	FRACTION_DIVISION	HARD	{mixed-numbers,both-mixed}
cmk37a6y1012wu2l7n9l2m5k1	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/2 × 1/3	1/6	FRACTION_MULTIPLICATION	EASY	{proper-fractions,no-simplification}
cmk37a6y1012xu2l7bui23cvv	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/2 × 1/4	1/8	FRACTION_MULTIPLICATION	EASY	{proper-fractions,no-simplification}
cmk37a6y1012yu2l755fqj3dq	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/3 × 1/4	1/12	FRACTION_MULTIPLICATION	EASY	{proper-fractions,no-simplification}
cmk37a6y1012zu2l7booh02vj	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/2 × 1/5	1/10	FRACTION_MULTIPLICATION	EASY	{proper-fractions,no-simplification}
cmk37a6y10130u2l70qf9hg41	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/3 × 1/5	1/15	FRACTION_MULTIPLICATION	EASY	{proper-fractions,no-simplification}
cmk37a6y10131u2l74wp624p8	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2/3 × 1/4	1/6	FRACTION_MULTIPLICATION	EASY	{proper-fractions,simplification-needed}
cmk37a6y10132u2l77x2g6qcb	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2/5 × 1/2	1/5	FRACTION_MULTIPLICATION	EASY	{proper-fractions,simplification-needed}
cmk37a6y10133u2l75nd0re4x	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3/4 × 1/2	3/8	FRACTION_MULTIPLICATION	EASY	{proper-fractions,no-simplification}
cmk37a6y10134u2l74yyk9czo	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2/3 × 1/2	1/3	FRACTION_MULTIPLICATION	EASY	{proper-fractions,simplification-needed}
cmk37a6y10135u2l7bvyirlqa	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3/5 × 1/3	1/5	FRACTION_MULTIPLICATION	EASY	{proper-fractions,simplification-needed}
cmk37a6y10136u2l7pa0hjnnp	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/4 × 1/5	1/20	FRACTION_MULTIPLICATION	EASY	{proper-fractions,no-simplification}
85915e0f-159a-43da-81e9-6a680f1a7d1f	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−5) × 6 × (−2)	60	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
976e9a65-67e9-4981-a145-2dd9fd9bde6e	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−4) × (−4) × (−4)	−64	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
01d40c64-a35d-4d09-96f1-e08ee962b3f2	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	2 × (−9) × 3	−54	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
cmk37a6y10138u2l781h41oqw	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2/3 × 3/4	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y10139u2l7hhjnxi2f	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3/4 × 2/5	3/10	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013au2l7iznp6mhk	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	4/5 × 2/3	8/15	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,no-simplification}
cmk37a6y1013bu2l754qstgbq	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3/5 × 5/6	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013cu2l79bv73o4y	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	4/7 × 3/8	3/14	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013du2l73fre6t3m	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	5/6 × 2/5	1/3	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013eu2l7mkp7tzsh	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3/8 × 4/9	1/6	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013fu2l7f08enads	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	7/8 × 2/3	7/12	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,no-simplification}
cmk37a6y1013gu2l7a144nclv	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	5/9 × 3/5	1/3	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013hu2l7td10qrgi	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2/7 × 5/6	5/21	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013iu2l7h39ihk4r	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	4/9 × 3/4	1/3	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013ju2l7ac5ygqur	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	5/8 × 4/5	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013ku2l7chzmgygw	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	6/7 × 5/9	10/21	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013lu2l7i1d238xw	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3/10 × 5/6	1/4	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013mu2l74oguk7d2	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	7/12 × 4/7	1/3	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013nu2l7jpfgc5bw	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	5/12 × 6/5	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013ou2l7w19mp5es	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	8/9 × 3/4	2/3	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013pu2l7qwtph5ng	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	7/10 × 5/7	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013qu2l7o7au790z	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/2 × 2/3	1/3	FRACTION_MULTIPLICATION	EASY	{proper-fractions,simplification-needed}
cmk37a6y1013ru2l70k1i84f5	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/3 × 3/5	1/5	FRACTION_MULTIPLICATION	EASY	{proper-fractions,simplification-needed}
cmk37a6y1013su2l7oodwforx	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/4 × 2/3	1/6	FRACTION_MULTIPLICATION	EASY	{proper-fractions,simplification-needed}
cmk37a6y1013tu2l7urrepyur	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/5 × 3/4	3/20	FRACTION_MULTIPLICATION	EASY	{proper-fractions,no-simplification}
cmk37a6y1013uu2l7g9x60pr6	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2/5 × 3/4	3/10	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013vu2l7nzmngghn	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3/7 × 2/3	2/7	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013wu2l7nrob7rok	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	4/9 × 1/2	2/9	FRACTION_MULTIPLICATION	EASY	{proper-fractions,simplification-needed}
cmk37a6y1013xu2l7ya79bh8k	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	5/6 × 3/5	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013yu2l7dtbuy34z	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2/9 × 3/4	1/6	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1013zu2l7idmat2pc	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	7/8 × 4/7	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y10140u2l7z9q7x5tm	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/6 × 3/4	1/8	FRACTION_MULTIPLICATION	EASY	{proper-fractions,simplification-needed}
cmk37a6y10141u2l7e4hc05wt	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	5/7 × 2/5	2/7	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y10142u2l7jnh0qi76	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3/8 × 2/3	1/4	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y10143u2l7iub21oau	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	4/5 × 5/8	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y10144u2l7haya8dmt	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	6/11 × 11/12	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y10145u2l77fehahvm	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/8 × 4/5	1/10	FRACTION_MULTIPLICATION	EASY	{proper-fractions,simplification-needed}
cmk37a6y10146u2l7658z0sfk	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2/7 × 7/8	1/4	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y10147u2l7vl485sl2	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	9/10 × 2/3	3/5	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y10148u2l7jenpxj37	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3/5 × 2/9	2/15	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y10149u2l7oj8k9k8x	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	7/9 × 3/7	1/3	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014au2l74tfp28ix	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	5/6 × 4/9	10/27	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014bu2l78u5nlp7n	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	7/10 × 8/9	28/45	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6yb019eu2l77owmtmt9	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√75	5√3	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
b279e33d-fb6c-4020-b788-1104eb9978a6	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−8) × 2 × (−4)	64	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
f7e50144-dd0b-4f87-9244-9754727e142d	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−7) × (−3) × (−2)	−42	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
cmk37a6y1014du2l7o8dvn7dr	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	8/15 × 5/12	2/9	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014eu2l7moqjuayu	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	11/12 × 6/11	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014fu2l7d9mqe3t3	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	7/15 × 10/21	2/9	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014gu2l70bj3o6jm	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	9/14 × 7/12	3/8	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014hu2l7vh2rxbet	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	5/16 × 8/15	1/6	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014iu2l79cth8vls	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	13/18 × 6/13	1/3	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014ju2l7wn8iiq1j	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	11/20 × 10/11	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014ku2l7tc8qgy2c	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	8/21 × 7/16	1/6	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014lu2l71z3q8fho	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	15/22 × 11/15	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014mu2l79ulyf5l2	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	9/20 × 5/12	3/16	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014nu2l7ip4yc3hh	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	14/25 × 15/28	3/10	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014ou2l74s7sp9n6	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	10/21 × 7/15	2/9	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014pu2l70xlwnspi	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	12/25 × 5/18	2/15	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014qu2l7lh1br4sq	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	16/27 × 9/20	4/15	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014ru2l7k3fb0enm	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	11/24 × 16/33	2/9	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014su2l7647m1am9	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	18/35 × 7/24	3/20	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014tu2l7xpiikdim	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	15/28 × 14/45	1/6	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014uu2l7mkv6p0om	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	20/33 × 11/30	2/9	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014vu2l7a7xgm4g9	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	17/36 × 12/17	1/3	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014wu2l7wm92ns3s	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	21/40 × 10/21	1/4	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y1014xu2l7i9qnmr5v	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	13/30 × 15/26	1/4	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2014yu2l7wxpkvbmb	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	22/35 × 5/11	2/7	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2014zu2l77f620ixc	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	19/42 × 14/19	1/3	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y20150u2l7tc3qgdi7	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	25/36 × 12/25	1/3	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y20151u2l7cu08fzkr	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	24/35 × 7/16	3/10	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y20152u2l7qabfob46	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	27/44 × 22/27	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y20153u2l71kb76eqs	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	28/45 × 15/28	1/3	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y20154u2l7n1ynnkeh	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3/4 × 4/5	3/5	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y20155u2l7yodf2adg	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	5/7 × 7/10	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y20156u2l7jwl0a4b4	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	8/9 × 9/16	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y20157u2l7qw4rgnqk	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	6/13 × 13/18	1/3	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y20158u2l71ges4dgv	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	10/17 × 17/20	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y20159u2l7m9otkvff	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	12/19 × 19/24	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015au2l7mitxjssf	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	14/23 × 23/28	1/2	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015bu2l7uj3a4vgi	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	9/16 × 8/27	1/6	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015cu2l7riapt18m	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	15/32 × 16/45	1/6	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015du2l7avrua4sr	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	21/50 × 25/42	1/4	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015eu2l7iwtufnw3	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	18/49 × 7/9	2/7	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015fu2l7tw845sfa	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	20/63 × 21/40	1/6	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015gu2l7g4kv7kbp	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	24/55 × 11/16	3/10	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
03f417db-b435-4850-919b-81969fa8e340	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	5 × (−2) × (−6)	60	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
835f5616-a4c0-4632-b131-611edce04fff	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	(−9) × 3 × (−4)	108	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
3fe59a99-8746-4f44-b40c-53bfb52b53c1	2026-02-25 04:56:44.391	2026-02-25 04:56:44.332	7 × (−5) × (−2)	70	INTEGERS_MULTIPLICATION	MEDIUM	{mixed-signs}
cmk37a6y2015iu2l724qoi6z7	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	30/77 × 11/15	2/7	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015ju2l79czb3pa6	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	35/72 × 18/35	1/4	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015ku2l7yv4e8xuk	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	33/80 × 20/33	1/4	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015lu2l7d2nib7cl	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	36/91 × 13/18	2/7	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015mu2l79vjaq704	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	40/99 × 33/80	1/6	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015nu2l7uht7doy9	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	42/95 × 19/42	1/5	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015ou2l7suza5qow	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/2 × 2	3	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,whole-number}
cmk37a6y2015pu2l71ni410qj	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 1/3 × 3	7	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,whole-number}
cmk37a6y2015qu2l71gqli5e3	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/4 × 4	5	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,whole-number}
cmk37a6y2015ru2l7ldqj50xj	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3 1/2 × 2	7	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,whole-number}
cmk37a6y2015su2l7rjigozjz	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 2/5 × 5	12	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,whole-number}
cmk37a6y2015tu2l7nu9d55w2	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/2 × 1 1/3	2	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y2015uu2l7pyxukzmn	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 1/2 × 1 1/5	3	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y2015vu2l7rcjm9i08	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/3 × 1 1/2	2	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y2015wu2l7wujfaq5h	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/4 × 1 1/3	1 2/3	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y2015xu2l7a28nkps6	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 1/3 × 1 1/2	3 1/2	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y2015yu2l7d1enepc4	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 2/3 × 1 1/5	2	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y2015zu2l73nyh20iq	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/2 × 2 2/3	4	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y20160u2l79p4vsicb	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 1/4 × 1 1/3	3	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y20161u2l771wbvnhd	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 3/4 × 1 1/7	2	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y20162u2l7rc2csvnl	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/5 × 1 2/3	2	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y20163u2l7co0iedcf	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 2/3 × 2 1/4	6	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y20164u2l7npc7ng3v	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/2 × 3 1/3	5	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y20165u2l7esuuvfji	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 1/2 × 2 2/5	6	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y20166u2l7q9630buy	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3 1/3 × 1 1/5	4	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y20167u2l74v51dnu5	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/4 × 2 2/5	3	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,both-mixed}
cmk37a6y20168u2l719mq5by0	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/2 × 1/2	3/4	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y20169u2l75fe5yqqc	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 1/3 × 3/4	1 3/4	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016au2l72a37evnz	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/4 × 2/3	5/6	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016bu2l7x89zxmnr	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3 1/2 × 2/7	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016cu2l79eq5cjen	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 2/5 × 5/8	1 1/2	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016du2l7t1amf153	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 2/3 × 3/5	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016eu2l7slbaqgop	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 1/2 × 4/5	2	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016fu2l7py29raub	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/3 × 3/4	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016gu2l7mfm5z7cj	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3 1/3 × 3/5	2	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016hu2l7vnj7rcqm	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/5 × 5/6	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016iu2l7r3ab6cyb	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 1/4 × 4/9	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016ju2l7lwgl6har	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 3/4 × 4/7	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016ku2l7zjznmk5y	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 2/3 × 3/8	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016lu2l7k8cxb8th	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/6 × 6/7	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016mu2l7f66ds58a	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3 1/5 × 5/8	2	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016nu2l7ustd2nlo	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/7 × 7/8	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6yb019fu2l754dotc3i	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√98	7√2	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a706025au2l7j9035bp3	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/8 - 2 2/9	65/72	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6y2016pu2l7gysjf2iy	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 3/5 × 5/8	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016qu2l7g6kwdo3r	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 1/3 × 6/7	2	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016ru2l7yyggo47a	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 2/5 × 5/7	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016su2l7gtv5l8yf	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3 1/4 × 4/13	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016tu2l7ruz0o3ar	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/8 × 8/9	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016uu2l7zdtv69j6	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 3/4 × 4/11	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016vu2l7rz15obl5	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 4/5 × 5/9	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016wu2l7h0kdstqc	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	3 2/3 × 3/11	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016xu2l7aot9n3ni	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 1/9 × 9/10	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016yu2l7ujfc1nvs	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 1/6 × 6/13	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y2016zu2l7lurbspsx	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 5/6 × 6/11	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y20170u2l7lzhk9ko2	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 3/5 × 5/13	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6y20171u2l7ivbxz5o3	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1 2/7 × 7/9	1	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6ya0172u2l7zh4hgamy	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2²	4	INDEX_POWERS	EASY	{squares,power-of-2}
cmk37a6ya0173u2l7b7rob51j	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3²	9	INDEX_POWERS	EASY	{squares,power-of-3}
cmk37a6ya0174u2l7lr2xp2n8	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	4²	16	INDEX_POWERS	EASY	{squares,power-of-4}
cmk37a6ya0175u2l73g2jqpli	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5²	25	INDEX_POWERS	EASY	{squares,power-of-5}
cmk37a6ya0176u2l783879tx8	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	6²	36	INDEX_POWERS	EASY	{squares}
cmk37a6ya0177u2l7h1kkxlro	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	7²	49	INDEX_POWERS	EASY	{squares}
cmk37a6ya0178u2l7firqkkcm	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	8²	64	INDEX_POWERS	EASY	{squares}
cmk37a6ya0179u2l7ds8ajz1j	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	9²	81	INDEX_POWERS	EASY	{squares}
cmk37a6ya017au2l7i6b4ufbl	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10²	100	INDEX_POWERS	EASY	{squares,power-of-10}
cmk37a6ya017bu2l7gp6el6hg	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	11²	121	INDEX_POWERS	EASY	{squares}
cmk37a6ya017cu2l788oefj8s	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	12²	144	INDEX_POWERS	EASY	{squares}
cmk37a6ya017du2l7bfq8mz1g	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	15²	225	INDEX_POWERS	EASY	{squares}
cmk37a6ya017eu2l78c5sah1r	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	20²	400	INDEX_POWERS	EASY	{squares}
cmk37a6ya017fu2l7h8zs5qdd	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	1²	1	INDEX_POWERS	EASY	{squares,power-of-1}
cmk37a6ya017gu2l73chwqj08	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	0²	0	INDEX_POWERS	EASY	{squares,power-of-0}
cmk37a6ya017hu2l7kdjwiuu8	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2³	8	INDEX_POWERS	EASY	{cubes,power-of-2}
cmk37a6ya017iu2l7ui0jfq0p	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3³	27	INDEX_POWERS	EASY	{cubes,power-of-3}
cmk37a6ya017ju2l721fvsnrc	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	4³	64	INDEX_POWERS	EASY	{cubes,power-of-4}
cmk37a6ya017ku2l7qd7swyov	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5³	125	INDEX_POWERS	EASY	{cubes,power-of-5}
cmk37a6ya017lu2l7e9qhvrjq	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10³	1000	INDEX_POWERS	EASY	{cubes,power-of-10}
cmk37a6ya017mu2l71oief00q	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	1³	1	INDEX_POWERS	EASY	{cubes,power-of-1}
cmk37a6ya017nu2l70sumypu2	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	0³	0	INDEX_POWERS	EASY	{cubes,power-of-0}
cmk37a6ya017ou2l7su6ucn57	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁴	16	INDEX_POWERS	EASY	{fourth-power,power-of-2}
cmk37a6ya017pu2l7pi1rsi3w	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3⁴	81	INDEX_POWERS	EASY	{fourth-power,power-of-3}
cmk37a6ya017qu2l7dxhkd32f	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10⁴	10000	INDEX_POWERS	EASY	{fourth-power,power-of-10}
cmk37a6ya017ru2l7spekofox	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁵	32	INDEX_POWERS	EASY	{fifth-power,power-of-2}
cmk37a6ya017su2l7n7zshs41	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3⁵	243	INDEX_POWERS	EASY	{fifth-power,power-of-3}
cmk37a6ya017tu2l76owl6jx5	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10⁵	100000	INDEX_POWERS	EASY	{fifth-power,power-of-10}
cmk37a6ya017uu2l738uin0io	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁶	64	INDEX_POWERS	EASY	{sixth-power,power-of-2}
cmk37a6yb017vu2l78ti3mt49	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10⁶	1000000	INDEX_POWERS	EASY	{sixth-power,power-of-10}
cmk37a6yb017wu2l7tyl4pwfl	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁰	1	INDEX_POWERS	EASY	{power-zero,power-of-2}
cmk37a6yb017xu2l73awvr8ol	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3⁰	1	INDEX_POWERS	EASY	{power-zero,power-of-3}
cmk37a6yb017yu2l7k1pztt99	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5⁰	1	INDEX_POWERS	EASY	{power-zero,power-of-5}
cmk37a6yb017zu2l78jt3pygj	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10⁰	1	INDEX_POWERS	EASY	{power-zero,power-of-10}
cmk37a6yb0181u2l7d3d3w1zl	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3¹	3	INDEX_POWERS	EASY	{power-one,power-of-3}
cmk37a6yb0182u2l7j81by5kl	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5¹	5	INDEX_POWERS	EASY	{power-one,power-of-5}
cmk37a6yb0183u2l7qopuauvh	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10¹	10	INDEX_POWERS	EASY	{power-one,power-of-10}
cmk37a6yb0184u2l79e3sjyl1	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(-2)²	4	INDEX_POWERS	EASY	{negative-base,squares}
cmk37a6yb0185u2l7bgocybgf	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(-3)²	9	INDEX_POWERS	EASY	{negative-base,squares}
cmk37a6yb0186u2l7hnt43y5f	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(-4)²	16	INDEX_POWERS	EASY	{negative-base,squares}
cmk37a6yb0187u2l7vi74buco	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(-5)²	25	INDEX_POWERS	EASY	{negative-base,squares}
cmk37a6yb0188u2l7yr4orn5s	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(-2)³	-8	INDEX_POWERS	EASY	{negative-base,cubes}
cmk37a6yb0189u2l7sgbkfwbc	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(-3)³	-27	INDEX_POWERS	EASY	{negative-base,cubes}
cmk37a6yb018au2l7fsocf59w	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(-1)²	1	INDEX_POWERS	EASY	{negative-base,squares}
cmk37a6yb018bu2l7mnq3gl1a	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(-1)³	-1	INDEX_POWERS	EASY	{negative-base,cubes}
cmk37a6yb018cu2l74ai64o6w	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	6³	216	INDEX_POWERS	EASY	{cubes}
cmk37a6yb018du2l7ubn3vvzg	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁷	128	INDEX_POWERS	EASY	{seventh-power,power-of-2}
cmk37a6yb018eu2l7rccgvtv3	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁸	256	INDEX_POWERS	EASY	{eighth-power,power-of-2}
cmk37a6yb018fu2l7k039mzrb	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	13²	169	INDEX_POWERS	EASY	{squares}
cmk37a6yb018gu2l736u2tqj9	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√4	2	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018hu2l7qug0cfui	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√9	3	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018iu2l71q2bh892	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√16	4	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018ju2l71gp4pbnc	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√25	5	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018ku2l719tlwi1s	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√36	6	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018lu2l7qr8psuub	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√49	7	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018mu2l7ui7qel9d	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√64	8	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018nu2l74dn2cnca	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√81	9	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018ou2l7jsy72cg9	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√100	10	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018pu2l7c60dxojk	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√121	11	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018qu2l7g5jdmdo0	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√144	12	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018ru2l74853wwe9	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√169	13	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018su2l7upnz2eev	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√196	14	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018tu2l7k89jl5qp	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√225	15	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018uu2l72hdyiiwz	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√256	16	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018vu2l7bixjmwey	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√289	17	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018wu2l7bip7fprh	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√324	18	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018xu2l7fdqon1el	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√361	19	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018yu2l7ztswp9b6	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√400	20	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb018zu2l7i6i4iod0	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√1	1	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb0190u2l7xloovw43	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√0	0	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb0191u2l702yd5vxl	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√625	25	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb0192u2l7fdjg0j3r	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√900	30	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb0193u2l7ztw076qp	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√1000	10√10	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb0194u2l7x8ps9xh2	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√8	2√2	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb0195u2l7fn1xb31f	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√12	2√3	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb0196u2l7ev5xiv66	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√18	3√2	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb0197u2l76uyaxhbw	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√20	2√5	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb0198u2l7nfkc3ynq	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√27	3√3	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb0199u2l79uweaph9	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√32	4√2	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb019au2l7kbnlciis	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√45	3√5	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb019bu2l7syqwlpc6	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√48	4√3	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb019cu2l7o4a60ysh	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√50	5√2	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb019hu2l7e2qu2ugm	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√128	8√2	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb019iu2l7g7m54j96	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√147	7√3	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb019ju2l7ph9bg3us	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√162	9√2	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb019ku2l7sjv41bll	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√200	10√2	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb019lu2l7mc1gm5ht	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√242	11√2	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb019mu2l72kjuuj4i	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√288	12√2	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb019nu2l7h5rnkw04	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√300	10√3	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb019ou2l78l0yf4t5	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√500	10√5	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb019pu2l7bs5k24j0	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√441	21	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb019qu2l78vbe5adj	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√484	22	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb019ru2l73x728unq	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√529	23	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb019su2l7x2u0xrz1	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√576	24	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb019tu2l78nut1rom	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√729	27	INDEX_SQUARE_ROOTS	EASY	{perfect-squares}
cmk37a6yb019uu2l79u30q640	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2² × 2³	2⁵	INDEX_LAWS	MEDIUM	{multiplication-law,same-base}
cmk37a6yb019vu2l7g57xrv09	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3² × 3⁴	3⁶	INDEX_LAWS	MEDIUM	{multiplication-law,same-base}
cmk37a6yb019wu2l7v4fx6pbb	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5³ × 5²	5⁵	INDEX_LAWS	MEDIUM	{multiplication-law,same-base}
cmk37a6yb019xu2l7q627609r	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁴ × 2¹	2⁵	INDEX_LAWS	MEDIUM	{multiplication-law,same-base}
cmk37a6yb019yu2l7oooch5kp	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3³ × 3³	3⁶	INDEX_LAWS	MEDIUM	{multiplication-law,same-base}
cmk37a6yb019zu2l7gbs54z28	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10² × 10³	10⁵	INDEX_LAWS	MEDIUM	{multiplication-law,same-base,power-of-10}
cmk37a6yb01a0u2l7szql8el3	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10⁴ × 10²	10⁶	INDEX_LAWS	MEDIUM	{multiplication-law,same-base,power-of-10}
cmk37a6yb01a1u2l721q43lnj	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2¹ × 2⁰	2¹	INDEX_LAWS	MEDIUM	{multiplication-law,same-base}
cmk37a6yb01a2u2l7tgr75o1b	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5⁰ × 5³	5³	INDEX_LAWS	MEDIUM	{multiplication-law,same-base}
cmk37a6yb01a3u2l7hslfij9c	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁵ ÷ 2²	2³	INDEX_LAWS	MEDIUM	{division-law,same-base}
cmk37a6yb01a4u2l7ec1hhk5c	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3⁶ ÷ 3²	3⁴	INDEX_LAWS	MEDIUM	{division-law,same-base}
cmk37a6yb01a5u2l7iefnhy9q	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5⁵ ÷ 5³	5²	INDEX_LAWS	MEDIUM	{division-law,same-base}
cmk37a6yb01a6u2l7umh6vrft	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁴ ÷ 2¹	2³	INDEX_LAWS	MEDIUM	{division-law,same-base}
cmk37a6yb01a7u2l7n7njyy6k	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3⁷ ÷ 3⁴	3³	INDEX_LAWS	MEDIUM	{division-law,same-base}
cmk37a6yb01a8u2l7xascj4b2	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10⁶ ÷ 10²	10⁴	INDEX_LAWS	MEDIUM	{division-law,same-base,power-of-10}
cmk37a6yb01a9u2l75cutiqs2	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10⁵ ÷ 10³	10²	INDEX_LAWS	MEDIUM	{division-law,same-base,power-of-10}
cmk37a6yb01aau2l7ln7jfa21	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2³ ÷ 2³	2⁰	INDEX_LAWS	MEDIUM	{division-law,same-base,result-power-zero}
cmk37a6yb01abu2l7f7cntb2e	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5⁴ ÷ 5⁴	5⁰	INDEX_LAWS	MEDIUM	{division-law,same-base,result-power-zero}
cmk37a6yb01acu2l70uposzd5	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(2²)³	2⁶	INDEX_LAWS	MEDIUM	{power-of-power}
cmk37a6yb01adu2l7cuwt5rkr	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(3²)²	3⁴	INDEX_LAWS	MEDIUM	{power-of-power}
cmk37a6yb01aeu2l7y9279j5g	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(5²)³	5⁶	INDEX_LAWS	MEDIUM	{power-of-power}
cmk37a6yb01afu2l7by7haium	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(2³)²	2⁶	INDEX_LAWS	MEDIUM	{power-of-power}
cmk37a6yb01agu2l74jitwe4z	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(10²)³	10⁶	INDEX_LAWS	MEDIUM	{power-of-power,power-of-10}
cmk37a6yb01ahu2l7xdx2601f	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(3³)²	3⁶	INDEX_LAWS	MEDIUM	{power-of-power}
cmk37a6yb01aiu2l7sygd0rdq	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(2¹)⁴	2⁴	INDEX_LAWS	MEDIUM	{power-of-power}
cmk37a6yb01aju2l7i5qtf1k4	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	x² × x³	x⁵	INDEX_LAWS	MEDIUM	{multiplication-law,variable}
cmk37a6yb01aku2l7tev1qqrn	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	a⁴ × a²	a⁶	INDEX_LAWS	MEDIUM	{multiplication-law,variable}
cmk37a6yb01alu2l7gsc2azrh	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	m³ × m⁵	m⁸	INDEX_LAWS	MEDIUM	{multiplication-law,variable}
cmk37a6yb01amu2l7e5d5jvir	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	y⁶ × y¹	y⁷	INDEX_LAWS	MEDIUM	{multiplication-law,variable}
cmk37a6yb01anu2l7z6eecbgf	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	p² × p²	p⁴	INDEX_LAWS	MEDIUM	{multiplication-law,variable}
cmk37a6yb01aou2l7q30bhmb4	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	x⁵ ÷ x²	x³	INDEX_LAWS	MEDIUM	{division-law,variable}
cmk37a6yb01apu2l7cg2hqcqp	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	a⁶ ÷ a³	a³	INDEX_LAWS	MEDIUM	{division-law,variable}
cmk37a6yb01aru2l7hv5o1zzi	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	y⁸ ÷ y⁵	y³	INDEX_LAWS	MEDIUM	{division-law,variable}
cmk37a6yb01asu2l7pyj8tg2y	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	p⁴ ÷ p⁴	p⁰	INDEX_LAWS	MEDIUM	{division-law,variable,result-power-zero}
cmk37a6yb01atu2l78tajw03p	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(x²)³	x⁶	INDEX_LAWS	MEDIUM	{power-of-power,variable}
cmk37a6yb01auu2l7bu5nuncp	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(a³)²	a⁶	INDEX_LAWS	MEDIUM	{power-of-power,variable}
cmk37a6yb01avu2l7euqilz4q	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(m²)⁴	m⁸	INDEX_LAWS	MEDIUM	{power-of-power,variable}
cmk37a6yb01awu2l7nv99ab2i	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(y³)³	y⁹	INDEX_LAWS	MEDIUM	{power-of-power,variable}
cmk37a6yb01axu2l73vy7958n	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(p⁴)²	p⁸	INDEX_LAWS	MEDIUM	{power-of-power,variable}
cmk37a6yb01ayu2l7ybyw9h7n	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2² × 2² × 2²	2⁶	INDEX_LAWS	MEDIUM	{multiplication-law,multiple-terms}
cmk37a6yb01azu2l7bypgquuu	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3¹ × 3² × 3³	3⁶	INDEX_LAWS	MEDIUM	{multiplication-law,multiple-terms}
cmk37a6yb01b0u2l72at9w31d	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	x² × x³ × x⁴	x⁹	INDEX_LAWS	MEDIUM	{multiplication-law,variable,multiple-terms}
cmk37a6yb01b1u2l7hy1b175b	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	a × a² × a³	a⁶	INDEX_LAWS	MEDIUM	{multiplication-law,variable,multiple-terms}
cmk37a6yb01b2u2l7m6eag470	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10¹ × 10² × 10³	10⁶	INDEX_LAWS	MEDIUM	{multiplication-law,power-of-10,multiple-terms}
cmk37a6yb01b3u2l7cz3lp67y	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(2×3)²	2² × 3²	INDEX_LAWS	MEDIUM	{product-power}
cmk37a6yb01b4u2l7qaueuu65	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(5×2)³	5³ × 2³	INDEX_LAWS	MEDIUM	{product-power}
cmk37a6yb01b5u2l78dc5re75	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(ab)²	a²b²	INDEX_LAWS	MEDIUM	{product-power,variable}
cmk37a6yb01b6u2l7ftaba20s	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(xy)³	x³y³	INDEX_LAWS	MEDIUM	{product-power,variable}
cmk37a6yb01b7u2l75blw2gf7	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(2×5)²	2² × 5²	INDEX_LAWS	MEDIUM	{product-power}
cmk37a6yb01b8u2l79bd7dbm7	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2³ × 2² ÷ 2⁴	2¹	INDEX_LAWS	MEDIUM	{mixed-operations}
cmk37a6yb01b9u2l75zs51rss	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3⁴ ÷ 3² × 3³	3⁵	INDEX_LAWS	MEDIUM	{mixed-operations}
cmk37a6yb01bau2l7zadewa5r	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5² × 5³ ÷ 5²	5³	INDEX_LAWS	MEDIUM	{mixed-operations}
cmk37a6yb01bbu2l7d1568re4	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10⁵ ÷ 10² × 10¹	10⁴	INDEX_LAWS	MEDIUM	{mixed-operations,power-of-10}
cmk37a6yc01bcu2l77zd2prln	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(2²)³ ÷ 2³	2³	INDEX_LAWS	MEDIUM	{mixed-operations,power-of-power}
cmk37a6yc01bdu2l7pltxqx8a	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(3³)² ÷ 3⁴	3²	INDEX_LAWS	MEDIUM	{mixed-operations,power-of-power}
cmk37a6yc01beu2l7a5kxvyuk	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁴ × (2²)²	2⁸	INDEX_LAWS	MEDIUM	{mixed-operations,power-of-power}
cmk37a6yc01bfu2l7kyzik6yq	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	x³ × x² ÷ x⁴	x¹	INDEX_LAWS	MEDIUM	{mixed-operations,variable}
cmk37a6yc01bgu2l76q8ffruq	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	a⁶ ÷ a² × a³	a⁷	INDEX_LAWS	MEDIUM	{mixed-operations,variable}
cmk37a6yc01bhu2l74zfooq9o	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	m⁵ × m³ ÷ m²	m⁶	INDEX_LAWS	MEDIUM	{mixed-operations,variable}
cmk37a6yc01biu2l7ug963ohb	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(x²)³ × x⁴	x¹⁰	INDEX_LAWS	MEDIUM	{mixed-operations,variable,power-of-power}
cmk37a6yc01bju2l7bxqnve39	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(a³)² ÷ a²	a⁴	INDEX_LAWS	MEDIUM	{mixed-operations,variable,power-of-power}
cmk37a6yc01bku2l7yowki09d	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: 2³ × 3²	72	INDEX_POWERS	MEDIUM	{different-bases,evaluate}
cmk37a6yc01blu2l7i4rvxd60	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: 2⁴ × 5²	400	INDEX_POWERS	MEDIUM	{different-bases,evaluate}
cmk37a6yc01bmu2l7xqajij83	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: 3² × 2³	72	INDEX_POWERS	MEDIUM	{different-bases,evaluate}
cmk37a6yc01bnu2l7yd2xjgoq	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: 10² × 2³	800	INDEX_POWERS	MEDIUM	{different-bases,evaluate}
cmk37a6yc01bou2l7c808ghm9	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Evaluate: √(2⁴)	4	INDEX_SQUARE_ROOTS	MEDIUM	{root-of-power}
cmk37a6yc01bpu2l707qkd429	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Evaluate: √(3⁴)	9	INDEX_SQUARE_ROOTS	MEDIUM	{root-of-power}
cmk37a6yc01bqu2l7gvigw3n4	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Evaluate: √(5²)	5	INDEX_SQUARE_ROOTS	MEDIUM	{root-of-power}
cmk37a6yc01bru2l7n8xuzcdc	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Evaluate: √(10⁴)	100	INDEX_SQUARE_ROOTS	MEDIUM	{root-of-power}
cmk37a6yc01bsu2l70hie9vj1	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: (√4)³	8	INDEX_SQUARE_ROOTS	MEDIUM	{power-of-root}
cmk37a6yc01btu2l7y2j4riuh	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: (√9)²	9	INDEX_SQUARE_ROOTS	MEDIUM	{power-of-root}
cmk37a6yc01buu2l7yr847hva	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: (√16)²	16	INDEX_SQUARE_ROOTS	MEDIUM	{power-of-root}
cmk37a6yc01bvu2l7ozoh8i69	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: (√25)²	25	INDEX_SQUARE_ROOTS	MEDIUM	{power-of-root}
cmk37a6yc01bwu2l7dshqz2o6	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√4 × √9	6	INDEX_SQUARE_ROOTS	MEDIUM	{multiply-roots}
cmk37a6yc01bxu2l7goxpcju8	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√16 × √25	20	INDEX_SQUARE_ROOTS	MEDIUM	{multiply-roots}
cmk37a6yc01bzu2l7eiy21nj4	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√100 × √4	20	INDEX_SQUARE_ROOTS	MEDIUM	{multiply-roots}
cmk37a6yc01c0u2l7n47wvnz5	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√36 ÷ √4	3	INDEX_SQUARE_ROOTS	MEDIUM	{divide-roots}
cmk37a6yc01c1u2l7adgvad0r	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√100 ÷ √25	2	INDEX_SQUARE_ROOTS	MEDIUM	{divide-roots}
cmk37a6yc01c2u2l736dnnsy9	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√81 ÷ √9	3	INDEX_SQUARE_ROOTS	MEDIUM	{divide-roots}
cmk37a6yc01c3u2l7w1xkyikb	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√144 ÷ √16	3	INDEX_SQUARE_ROOTS	MEDIUM	{divide-roots}
cmk37a6yc01c4u2l7tpqzijoa	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√(4 × 9)	6	INDEX_SQUARE_ROOTS	MEDIUM	{root-of-product}
cmk37a6yc01c5u2l76y0rqjiy	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√(16 × 25)	20	INDEX_SQUARE_ROOTS	MEDIUM	{root-of-product}
cmk37a6yc01c6u2l7m2vispwq	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√(9 × 16)	12	INDEX_SQUARE_ROOTS	MEDIUM	{root-of-product}
cmk37a6yc01c7u2l7ohiz3h6n	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√(100 × 4)	20	INDEX_SQUARE_ROOTS	MEDIUM	{root-of-product}
cmk37a6yc01c8u2l7r4zmsloa	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2 × √9	6	INDEX_SQUARE_ROOTS	MEDIUM	{coefficient-times-root}
cmk37a6yc01c9u2l70a2irzwa	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3 × √16	12	INDEX_SQUARE_ROOTS	MEDIUM	{coefficient-times-root}
cmk37a6yc01cau2l7d0glxhpw	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	4 × √25	20	INDEX_SQUARE_ROOTS	MEDIUM	{coefficient-times-root}
cmk37a6yc01cbu2l7mthjftlh	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5 × √4	10	INDEX_SQUARE_ROOTS	MEDIUM	{coefficient-times-root}
cmk37a6yc01ccu2l7opgvw9t7	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√9 + √16	7	INDEX_SQUARE_ROOTS	MEDIUM	{add-roots}
cmk37a6yc01cdu2l7hq158l4i	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√25 + √36	11	INDEX_SQUARE_ROOTS	MEDIUM	{add-roots}
cmk37a6yc01ceu2l778h57pnj	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√49 + √64	15	INDEX_SQUARE_ROOTS	MEDIUM	{add-roots}
cmk37a6yc01cfu2l7pfkq0k8j	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√100 - √36	4	INDEX_SQUARE_ROOTS	MEDIUM	{subtract-roots}
cmk37a6yc01cgu2l7qq6sjkcu	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√81 - √49	2	INDEX_SQUARE_ROOTS	MEDIUM	{subtract-roots}
cmk37a6yc01chu2l7dc5aaagi	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√64 - √16	4	INDEX_SQUARE_ROOTS	MEDIUM	{subtract-roots}
cmk37a6yc01ciu2l7z4vmba6q	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√121 - √25	6	INDEX_SQUARE_ROOTS	MEDIUM	{subtract-roots}
cmk37a6yc01cju2l7l4fsslre	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2² + 3²	13	INDEX_POWERS	MEDIUM	{add-powers,evaluate}
cmk37a6yc01cku2l7k47nfccq	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	4² - 2³	8	INDEX_POWERS	MEDIUM	{subtract-powers,evaluate}
cmk37a6yc01clu2l7j4xejk2z	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5² + 2³	33	INDEX_POWERS	MEDIUM	{add-powers,evaluate}
cmk37a6yc01cmu2l70u5kgfzl	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁻¹	1/2	INDEX_POWERS	HARD	{negative-exponent}
cmk37a6yc01cnu2l7y6fcvoz1	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁻²	1/4	INDEX_POWERS	HARD	{negative-exponent}
cmk37a6yc01cou2l7odmqzrxq	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁻³	1/8	INDEX_POWERS	HARD	{negative-exponent}
cmk37a6yc01cpu2l7f3rho594	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3⁻²	1/9	INDEX_POWERS	HARD	{negative-exponent}
cmk37a6yc01cqu2l7vds8hnva	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5⁻²	1/25	INDEX_POWERS	HARD	{negative-exponent}
cmk37a6yc01cru2l7udww02r0	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10⁻²	0.01	INDEX_POWERS	HARD	{negative-exponent,power-of-10}
cmk37a6yc01csu2l7577bbu62	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10⁻³	0.001	INDEX_POWERS	HARD	{negative-exponent,power-of-10}
cmk37a6yc01ctu2l7fxpdl4v9	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2³ × 2⁻²	2¹	INDEX_LAWS	HARD	{negative-exponent,mixed-operations}
cmk37a6yc01cuu2l7bcurqk57	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	3⁴ × 3⁻²	3²	INDEX_LAWS	HARD	{negative-exponent,mixed-operations}
cmk37a6yc01cvu2l7gdjapt6y	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	5² × 5⁻³	5⁻¹	INDEX_LAWS	HARD	{negative-exponent,mixed-operations}
cmk37a6yc01cwu2l7102i51ln	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁻³ × 2⁵	2²	INDEX_LAWS	HARD	{negative-exponent,mixed-operations}
cmk37a6yc01cxu2l7g1y3xf7o	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	10³ ÷ 10⁵	10⁻²	INDEX_LAWS	HARD	{negative-exponent,division-law}
cmk37a6yc01cyu2l75y032vlp	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2² ÷ 2⁴	2⁻²	INDEX_LAWS	HARD	{negative-exponent,division-law}
cmk37a6yc01czu2l7fi5hr6ge	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(2⁻²)³	2⁻⁶	INDEX_LAWS	HARD	{negative-exponent,power-of-power}
cmk37a6yc01d0u2l7e1y2x6ao	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(3⁻¹)²	3⁻²	INDEX_LAWS	HARD	{negative-exponent,power-of-power}
cmk37a6yc01d1u2l77hi7sdzw	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	x⁻² × x⁵	x³	INDEX_LAWS	HARD	{negative-exponent,variable}
cmk37a6yc01d2u2l7lszirogu	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	a³ × a⁻⁵	a⁻²	INDEX_LAWS	HARD	{negative-exponent,variable}
cmk37a6yc01d3u2l7ijyb1x1k	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	m⁻⁴ ÷ m⁻²	m⁻²	INDEX_LAWS	HARD	{negative-exponent,variable}
cmk37a6yc01d4u2l7r9vyyifg	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	4^(1/2)	2	INDEX_POWERS	HARD	{fractional-exponent}
cmk37a6yc01d5u2l75fz8r6pm	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	9^(1/2)	3	INDEX_POWERS	HARD	{fractional-exponent}
cmk37a6yc01d6u2l72h210gl1	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	8^(1/3)	2	INDEX_POWERS	HARD	{fractional-exponent,cube-root}
cmk37a6yc01d7u2l77hcadm6i	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	27^(1/3)	3	INDEX_POWERS	HARD	{fractional-exponent,cube-root}
cmk37a6yc01d8u2l73w5rgys2	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	16^(1/2)	4	INDEX_POWERS	HARD	{fractional-exponent}
cmk37a6yc01d9u2l7lsnkb42u	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	25^(1/2)	5	INDEX_POWERS	HARD	{fractional-exponent}
cmk37a6yc01dbu2l7wiyvg1e1	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	125^(1/3)	5	INDEX_POWERS	HARD	{fractional-exponent,cube-root}
cmk37a6yc01dcu2l768si3jv4	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	16^(3/2)	64	INDEX_POWERS	HARD	{fractional-exponent}
cmk37a6yc01ddu2l7n5pcixi3	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	8^(2/3)	4	INDEX_POWERS	HARD	{fractional-exponent}
cmk37a6yc01deu2l7w4uey458	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	27^(2/3)	9	INDEX_POWERS	HARD	{fractional-exponent}
cmk37a6yc01dfu2l7no4ygbmz	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√(x⁶)	x³	INDEX_SQUARE_ROOTS	HARD	{variable,root-of-power}
cmk37a6yc01dgu2l7jnzjq88v	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√(a⁸)	a⁴	INDEX_SQUARE_ROOTS	HARD	{variable,root-of-power}
cmk37a6yc01dhu2l7o941gjl3	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√(m¹⁰)	m⁵	INDEX_SQUARE_ROOTS	HARD	{variable,root-of-power}
cmk37a6yc01diu2l7p7al4zsw	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √(2x²)	x√2	INDEX_SQUARE_ROOTS	HARD	{variable,simplify-roots}
cmk37a6yc01dju2l7alzvuvt2	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √(18x²)	3x√2	INDEX_SQUARE_ROOTS	HARD	{variable,simplify-roots}
cmk37a6yc01dku2l7kwk59dfm	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √(50a²)	5a√2	INDEX_SQUARE_ROOTS	HARD	{variable,simplify-roots}
cmk37a6yc01dlu2l7c41ew1ko	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2⁴ × 3² ÷ 2³	2 × 3² or 18	INDEX_LAWS	HARD	{different-bases,mixed-operations}
cmk37a6yc01dmu2l7oltvdddx	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(2³)² × 2⁻⁴	2²	INDEX_LAWS	HARD	{negative-exponent,power-of-power,mixed-operations}
cmk37a6yc01dnu2l7e2kayxdf	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(3²)³ ÷ 3⁵	3¹	INDEX_LAWS	HARD	{power-of-power,mixed-operations}
cmk37a6yc01dou2l7x6qqmkjd	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	x⁴ × x⁻² ÷ x³	x⁻¹	INDEX_LAWS	HARD	{negative-exponent,variable,mixed-operations}
cmk37a6yc01dpu2l7rwxeqiz8	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	(a²)³ × a⁻⁴	a²	INDEX_LAWS	HARD	{negative-exponent,variable,power-of-power}
cmk37a6yc01dqu2l7fdcliv3k	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √2 × √8	4	INDEX_SQUARE_ROOTS	HARD	{multiply-roots,simplify-roots}
cmk37a6yc01dru2l7zthd0q1l	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √3 × √27	9	INDEX_SQUARE_ROOTS	HARD	{multiply-roots,simplify-roots}
cmk37a6yc01dsu2l7yqcyt8o4	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √5 × √20	10	INDEX_SQUARE_ROOTS	HARD	{multiply-roots,simplify-roots}
cmk37a6yc01dtu2l7k8jo3eku	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √12 × √3	6	INDEX_SQUARE_ROOTS	HARD	{multiply-roots,simplify-roots}
cmk37a6yc01duu2l73i5xvtkn	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √18 × √2	6	INDEX_SQUARE_ROOTS	HARD	{multiply-roots,simplify-roots}
cmk37a6yc01dvu2l7jme1dvvi	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √50 ÷ √2	5	INDEX_SQUARE_ROOTS	HARD	{divide-roots,simplify-roots}
cmk37a6yc01dwu2l7ejoat0n7	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √75 ÷ √3	5	INDEX_SQUARE_ROOTS	HARD	{divide-roots,simplify-roots}
cmk37a6yc01dxu2l7cdz29z2q	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √32 + √8	6√2	INDEX_SQUARE_ROOTS	HARD	{add-roots,simplify-roots}
cmk37a6yc01dyu2l7d4nfq5r0	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √27 + √12	5√3	INDEX_SQUARE_ROOTS	HARD	{add-roots,simplify-roots}
cmk37a6yc01dzu2l7xqzgyltl	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	Simplify: √50 - √8	3√2	INDEX_SQUARE_ROOTS	HARD	{subtract-roots,simplify-roots}
cmk37a6yo01e0u2l7qyp0il93	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 + 3	8	INTEGERS_ADDITION	EASY	{positive-addition}
cmk37a6yo01e1u2l7s2eepiwr	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	7 + 2	9	INTEGERS_ADDITION	EASY	{positive-addition}
cmk37a6yo01e2u2l7nx40305f	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	4 + 6	10	INTEGERS_ADDITION	EASY	{positive-addition}
cmk37a6yo01e3u2l76c6p6kwu	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	8 + 5	13	INTEGERS_ADDITION	EASY	{positive-addition}
cmk37a6yo01e4u2l799qlwm25	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	3 + 9	12	INTEGERS_ADDITION	EASY	{positive-addition}
cmk37a6yo01e5u2l7vnad14g4	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 + (-2)	3	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01e6u2l7a7y0b0jn	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	8 + (-3)	5	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01e7u2l7q1j1yc1u	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	10 + (-4)	6	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01e8u2l7ns0ajcka	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	7 + (-5)	2	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01e9u2l78qmlqqnu	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	9 + (-6)	3	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01eau2l7ql01xw9e	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	6 + (-1)	5	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01ebu2l789lzznv0	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	12 + (-7)	5	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01ecu2l7qqbwjlqe	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	15 + (-8)	7	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01edu2l7rnutoeq3	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	11 + (-9)	2	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01eeu2l76o2ggu75	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	13 + (-5)	8	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01efu2l7323efdbs	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) + 7	4	INTEGERS_ADDITION	EASY	{negative-plus-positive}
cmk37a6yo01ehu2l7skvipr3o	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-2) + 8	6	INTEGERS_ADDITION	EASY	{negative-plus-positive}
cmk37a6yo01eiu2l70sskfuz0	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-4) + 10	6	INTEGERS_ADDITION	EASY	{negative-plus-positive}
cmk37a6yo01eju2l7sf4c17jz	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-6) + 11	5	INTEGERS_ADDITION	EASY	{negative-plus-positive}
cmk37a6yo01eku2l7vcjk52lp	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-1) + 5	4	INTEGERS_ADDITION	EASY	{negative-plus-positive}
cmk37a6yo01elu2l7xr9wdcha	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-7) + 12	5	INTEGERS_ADDITION	EASY	{negative-plus-positive}
cmk37a6yo01emu2l7hsb9frgn	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-8) + 15	7	INTEGERS_ADDITION	EASY	{negative-plus-positive}
cmk37a6yo01enu2l7i6f7g7y0	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-9) + 14	5	INTEGERS_ADDITION	EASY	{negative-plus-positive}
cmk37a6yo01eou2l78uv9rvs5	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) + 6	3	INTEGERS_ADDITION	EASY	{negative-plus-positive}
cmk37a6yo01epu2l7shezacfs	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-2) + (-3)	-5	INTEGERS_ADDITION	EASY	{negative-addition}
cmk37a6yo01equ2l7vjt0tjeq	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-4) + (-5)	-9	INTEGERS_ADDITION	EASY	{negative-addition}
cmk37a6yo01eru2l74l0c0nwl	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-6) + (-2)	-8	INTEGERS_ADDITION	EASY	{negative-addition}
cmk37a6yo01esu2l7mxs8pnm0	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-1) + (-7)	-8	INTEGERS_ADDITION	EASY	{negative-addition}
cmk37a6yo01etu2l7n2nppz3m	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) + (-4)	-7	INTEGERS_ADDITION	EASY	{negative-addition}
cmk37a6yo01euu2l710qr2buy	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-5) + (-3)	-8	INTEGERS_ADDITION	EASY	{negative-addition}
cmk37a6yo01evu2l79tqfvks6	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-8) + (-2)	-10	INTEGERS_ADDITION	EASY	{negative-addition}
cmk37a6yo01ewu2l760fswhj1	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-7) + (-3)	-10	INTEGERS_ADDITION	EASY	{negative-addition}
cmk37a6yo01exu2l72evkor7k	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-6) + (-5)	-11	INTEGERS_ADDITION	EASY	{negative-addition}
cmk37a6yo01eyu2l7hvxbl7xv	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-4) + (-8)	-12	INTEGERS_ADDITION	EASY	{negative-addition}
cmk37a6yo01ezu2l7iisarvxr	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 + 0	5	INTEGERS_ADDITION	EASY	{adding-zero}
cmk37a6yo01f0u2l7audqy8qw	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	0 + 7	7	INTEGERS_ADDITION	EASY	{adding-zero}
cmk37a6yo01f1u2l74ol63yot	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) + 0	-3	INTEGERS_ADDITION	EASY	{adding-zero}
cmk37a6yo01f2u2l7xhggp6ds	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	0 + (-5)	-5	INTEGERS_ADDITION	EASY	{adding-zero}
cmk37a6yo01f3u2l76t66acwg	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	3 + (-3)	0	INTEGERS_ADDITION	EASY	{opposites}
cmk37a6yo01f4u2l7ys0cb433	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 + (-5)	0	INTEGERS_ADDITION	EASY	{opposites}
cmk37a6yo01f5u2l7bd5oid05	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	8 + (-8)	0	INTEGERS_ADDITION	EASY	{opposites}
cmk37a6yo01f6u2l7ruoy5u6z	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-7) + 7	0	INTEGERS_ADDITION	EASY	{opposites}
cmk37a6yo01f7u2l78jid09m9	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-10) + 10	0	INTEGERS_ADDITION	EASY	{opposites}
cmk37a6yo01f8u2l72bc9o34y	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	12 + (-5)	7	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01f9u2l7qbwdevk9	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-9) + 13	4	INTEGERS_ADDITION	EASY	{negative-plus-positive}
cmk37a6yo01fau2l7qgvgvqp7	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	14 + (-6)	8	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01fbu2l7iciyuljt	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-11) + 15	4	INTEGERS_ADDITION	EASY	{negative-plus-positive}
cmk37a6yo01fcu2l72tioflib	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-9) + (-6)	-15	INTEGERS_ADDITION	EASY	{negative-addition}
cmk37a6yo01fdu2l764alaorz	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	16 + (-9)	7	INTEGERS_ADDITION	EASY	{positive-plus-negative}
cmk37a6yo01feu2l7vjfc0p5j	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	8 - 3	5	INTEGERS_SUBTRACTION	EASY	{positive-subtraction}
cmk37a6yo01ffu2l74a29p2k4	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	10 - 4	6	INTEGERS_SUBTRACTION	EASY	{positive-subtraction}
cmk37a6yo01fgu2l75ydljhx8	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	12 - 5	7	INTEGERS_SUBTRACTION	EASY	{positive-subtraction}
cmk37a6yo01fhu2l7cyjkv5ev	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	15 - 7	8	INTEGERS_SUBTRACTION	EASY	{positive-subtraction}
cmk37a6yo01fiu2l7na22k1gw	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	9 - 2	7	INTEGERS_SUBTRACTION	EASY	{positive-subtraction}
cmk37a6yo01fju2l723shd9mq	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 - (-2)	7	INTEGERS_SUBTRACTION	EASY	{subtracting-negative}
cmk37a6yo01fku2l7if007k2e	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	8 - (-3)	11	INTEGERS_SUBTRACTION	EASY	{subtracting-negative}
cmk37a6yo01flu2l78sa89wer	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	10 - (-4)	14	INTEGERS_SUBTRACTION	EASY	{subtracting-negative}
cmk37a6yo01fmu2l7qv6520jk	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	6 - (-5)	11	INTEGERS_SUBTRACTION	EASY	{subtracting-negative}
cmk37a6yo01fnu2l7dj7d40vl	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	7 - (-1)	8	INTEGERS_SUBTRACTION	EASY	{subtracting-negative}
cmk37a6yo01fou2l7oqgeu05g	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	12 - (-6)	18	INTEGERS_SUBTRACTION	EASY	{subtracting-negative}
cmk37a6yo01fpu2l7oln7xtey	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	9 - (-7)	16	INTEGERS_SUBTRACTION	EASY	{subtracting-negative}
cmk37a6yo01fqu2l77rsb3buz	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	15 - (-5)	20	INTEGERS_SUBTRACTION	EASY	{subtracting-negative}
cmk37a6yo01fru2l7o4ctwdba	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	11 - (-8)	19	INTEGERS_SUBTRACTION	EASY	{subtracting-negative}
cmk37a6yo01ftu2l7usjhte91	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	3 - 7	-4	INTEGERS_SUBTRACTION	EASY	{positive-result-negative}
cmk37a6yo01fuu2l7wexmqhqj	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 - 9	-4	INTEGERS_SUBTRACTION	EASY	{positive-result-negative}
cmk37a6yo01fvu2l7jxa05mca	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	2 - 8	-6	INTEGERS_SUBTRACTION	EASY	{positive-result-negative}
cmk37a6yo01fwu2l75ebgnd2a	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	4 - 10	-6	INTEGERS_SUBTRACTION	EASY	{positive-result-negative}
cmk37a6yo01fxu2l7ag9uj3cz	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	6 - 11	-5	INTEGERS_SUBTRACTION	EASY	{positive-result-negative}
cmk37a6yo01fyu2l7tivja0bl	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	1 - 6	-5	INTEGERS_SUBTRACTION	EASY	{positive-result-negative}
cmk37a6yp01fzu2l701po19mu	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	7 - 12	-5	INTEGERS_SUBTRACTION	EASY	{positive-result-negative}
cmk37a6yp01g0u2l75mdxi4yz	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	8 - 15	-7	INTEGERS_SUBTRACTION	EASY	{positive-result-negative}
cmk37a6yp01g1u2l7w6tsnjz8	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	3 - 10	-7	INTEGERS_SUBTRACTION	EASY	{positive-result-negative}
cmk37a6yp01g2u2l7yoxkbwl8	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 - 13	-8	INTEGERS_SUBTRACTION	EASY	{positive-result-negative}
cmk37a6yp01g3u2l759sl3zne	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) - 5	-8	INTEGERS_SUBTRACTION	EASY	{negative-minus-positive}
cmk37a6yp01g4u2l78qsoovh5	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-5) - 4	-9	INTEGERS_SUBTRACTION	EASY	{negative-minus-positive}
cmk37a6yp01g5u2l7fp77rqov	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-2) - 6	-8	INTEGERS_SUBTRACTION	EASY	{negative-minus-positive}
cmk37a6yp01g6u2l7uongr013	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-4) - 7	-11	INTEGERS_SUBTRACTION	EASY	{negative-minus-positive}
cmk37a6yp01g7u2l7er26mn4x	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-6) - 3	-9	INTEGERS_SUBTRACTION	EASY	{negative-minus-positive}
cmk37a6yp01g8u2l75mk3iau9	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-1) - 8	-9	INTEGERS_SUBTRACTION	EASY	{negative-minus-positive}
cmk37a6yp01g9u2l7nwa0p2ni	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-7) - 5	-12	INTEGERS_SUBTRACTION	EASY	{negative-minus-positive}
cmk37a6yp01gau2l7uix9lns1	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-8) - 2	-10	INTEGERS_SUBTRACTION	EASY	{negative-minus-positive}
cmk37a6yp01gbu2l7j4r13i8o	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-9) - 6	-15	INTEGERS_SUBTRACTION	EASY	{negative-minus-positive}
cmk37a6yp01gcu2l7arm3t5gt	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) - 9	-12	INTEGERS_SUBTRACTION	EASY	{negative-minus-positive}
cmk37a6yp01gdu2l7ddp6ei5k	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-5) - (-2)	-3	INTEGERS_SUBTRACTION	EASY	{negative-minus-negative}
cmk37a6yp01geu2l74gar67o3	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-8) - (-3)	-5	INTEGERS_SUBTRACTION	EASY	{negative-minus-negative}
cmk37a6yp01gfu2l7yuisubvj	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-10) - (-4)	-6	INTEGERS_SUBTRACTION	EASY	{negative-minus-negative}
cmk37a6yp01ggu2l7l7yu6ohm	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-7) - (-5)	-2	INTEGERS_SUBTRACTION	EASY	{negative-minus-negative}
cmk37a6yp01ghu2l7nixrmlzc	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-6) - (-1)	-5	INTEGERS_SUBTRACTION	EASY	{negative-minus-negative}
cmk37a6yp01giu2l7eg6my3c4	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-12) - (-7)	-5	INTEGERS_SUBTRACTION	EASY	{negative-minus-negative}
cmk37a6yp01gju2l7r17l9j2m	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-15) - (-8)	-7	INTEGERS_SUBTRACTION	EASY	{negative-minus-negative}
cmk37a6yp01gku2l7dpqfut73	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-9) - (-6)	-3	INTEGERS_SUBTRACTION	EASY	{negative-minus-negative}
cmk37a6yp01glu2l7iqb965gd	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-4) - (-4)	0	INTEGERS_SUBTRACTION	EASY	{same-numbers}
cmk37a6yp01gmu2l72x6ud9rh	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 - 5	0	INTEGERS_SUBTRACTION	EASY	{same-numbers}
cmk37a6yp01gnu2l77boviqkd	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	7 - 0	7	INTEGERS_SUBTRACTION	EASY	{subtracting-zero}
cmk37a6yp01gou2l7v4cyjt0y	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-5) - 0	-5	INTEGERS_SUBTRACTION	EASY	{subtracting-zero}
cmk37a6yp01gpu2l7f2yobwor	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	0 - 6	-6	INTEGERS_SUBTRACTION	EASY	{zero-minus}
cmk37a6yp01gqu2l7d048inna	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	0 - (-4)	4	INTEGERS_SUBTRACTION	EASY	{zero-minus-negative}
cmk37a6yp01gru2l7aus3732a	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) - (-8)	5	INTEGERS_SUBTRACTION	EASY	{negative-minus-negative-positive}
cmk37a6yp01gsu2l71ht4o5r5	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	3 × 4	12	INTEGERS_MULTIPLICATION	MEDIUM	{positive-multiplication}
cmk37a6yp01gtu2l7n1ju3wdj	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 × 6	30	INTEGERS_MULTIPLICATION	MEDIUM	{positive-multiplication}
cmk37a6yp01guu2l7qxobybfv	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	7 × 3	21	INTEGERS_MULTIPLICATION	MEDIUM	{positive-multiplication}
cmk37a6yp01gvu2l789nmf2jc	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	8 × 5	40	INTEGERS_MULTIPLICATION	MEDIUM	{positive-multiplication}
cmk37a6yp01gwu2l7tpjw7ryr	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	4 × 9	36	INTEGERS_MULTIPLICATION	MEDIUM	{positive-multiplication}
cmk37a6yp01gxu2l75hxqf5w5	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	3 × (-4)	-12	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6yp01gyu2l70qma851i	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 × (-6)	-30	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6yp01gzu2l7f30rtdms	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	7 × (-3)	-21	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6yp01h0u2l730crzjj7	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	8 × (-5)	-40	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6yp01h1u2l72gdf9rr3	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	4 × (-9)	-36	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6yp01h2u2l7q7mch89s	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	6 × (-7)	-42	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6yp01h4u2l7tft5t29v	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	12 × (-3)	-36	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6yp01h5u2l77phltu20	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	10 × (-5)	-50	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6yp01h6u2l78jonvquv	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	11 × (-4)	-44	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6yp01h7u2l7ndj4mwbf	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) × 4	-12	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6yp01h8u2l7pyuajk65	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-5) × 6	-30	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6yp01h9u2l7zpgiy7zq	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-7) × 3	-21	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6yp01hau2l71y1xvbrg	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-8) × 5	-40	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6yp01hbu2l7141efiog	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-4) × 9	-36	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6yp01hcu2l7p1gufew0	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-6) × 7	-42	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6yp01hdu2l7y2ymu7ak	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-9) × 2	-18	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6yp01heu2l7v5vdgpvu	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-12) × 3	-36	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6yp01hfu2l72ajg6m4s	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-10) × 5	-50	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6yp01hgu2l7oxvl13c9	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-11) × 4	-44	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6yp01hhu2l7dlyt4k3c	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) × (-4)	12	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6yp01hiu2l7a9x7oiue	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-5) × (-6)	30	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6yp01hju2l7hjkxh1w5	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-7) × (-3)	21	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6yp01hku2l7wu32bvfz	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-8) × (-5)	40	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6yp01hlu2l7mkwd2wh4	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-4) × (-9)	36	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6yp01hmu2l7qnd3ichc	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-6) × (-7)	42	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6yp01hnu2l7ae0pvckc	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-9) × (-2)	18	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6yp01hou2l723vylx7u	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-12) × (-3)	36	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6yp01hpu2l7motdxlua	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-10) × (-5)	50	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6yp01hqu2l7b4vhp4ht	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-11) × (-4)	44	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6yp01hru2l74qp0sisr	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 × 0	0	INTEGERS_MULTIPLICATION	MEDIUM	{multiply-by-zero}
cmk37a6yp01hsu2l7g2yk1nm4	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	0 × 7	0	INTEGERS_MULTIPLICATION	MEDIUM	{multiply-by-zero}
cmk37a6yp01htu2l7b6cwd1j7	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) × 0	0	INTEGERS_MULTIPLICATION	MEDIUM	{multiply-by-zero}
cmk37a6yp01huu2l7z0pqv4ft	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	0 × (-8)	0	INTEGERS_MULTIPLICATION	MEDIUM	{multiply-by-zero}
cmk37a6yp01hvu2l7i8dkatus	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	6 × 1	6	INTEGERS_MULTIPLICATION	MEDIUM	{multiply-by-one}
cmk37a6yp01hwu2l7yd020qxb	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	1 × 9	9	INTEGERS_MULTIPLICATION	MEDIUM	{multiply-by-one}
cmk37a6yp01hxu2l7lzl56s50	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-4) × 1	-4	INTEGERS_MULTIPLICATION	MEDIUM	{multiply-by-one}
cmk37a6yp01hyu2l7bpab3hu1	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	1 × (-7)	-7	INTEGERS_MULTIPLICATION	MEDIUM	{multiply-by-one}
cmk37a6yp01hzu2l7y19545jk	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 × (-1)	-5	INTEGERS_MULTIPLICATION	MEDIUM	{multiply-by-negative-one}
cmk37a6yp01i0u2l7uen8o7ic	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-1) × 8	-8	INTEGERS_MULTIPLICATION	MEDIUM	{multiply-by-negative-one}
cmk37a6yp01i1u2l7h8u65s9c	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-6) × (-1)	6	INTEGERS_MULTIPLICATION	MEDIUM	{multiply-by-negative-one}
cmk37a6yp01i2u2l708a8pzsz	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-1) × (-9)	9	INTEGERS_MULTIPLICATION	MEDIUM	{multiply-by-negative-one}
cmk37a6yp01i3u2l7819h4449	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-2) × (-10)	20	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-negative}
cmk37a6yp01i4u2l78hktwqmo	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	13 × (-2)	-26	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6yp01i5u2l747q68gt2	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-15) × 2	-30	INTEGERS_MULTIPLICATION	MEDIUM	{negative-times-positive}
cmk37a6yp01i6u2l7p5cu276r	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	12 ÷ 3	4	INTEGERS_DIVISION	MEDIUM	{positive-division}
cmk37a6yp01i7u2l78v8448pn	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	20 ÷ 4	5	INTEGERS_DIVISION	MEDIUM	{positive-division}
cmk37a6yp01i8u2l7zsq2kxp1	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	24 ÷ 6	4	INTEGERS_DIVISION	MEDIUM	{positive-division}
cmk37a6yp01i9u2l703xbdt37	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	30 ÷ 5	6	INTEGERS_DIVISION	MEDIUM	{positive-division}
cmk37a6yp01iau2l716ij3p5u	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	36 ÷ 9	4	INTEGERS_DIVISION	MEDIUM	{positive-division}
cmk37a6yp01ibu2l7179v8udz	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	12 ÷ (-3)	-4	INTEGERS_DIVISION	MEDIUM	{positive-div-negative}
cmk37a6yp01icu2l751umghmc	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	20 ÷ (-4)	-5	INTEGERS_DIVISION	MEDIUM	{positive-div-negative}
cmk37a6yp01idu2l7wev2mu8k	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	24 ÷ (-6)	-4	INTEGERS_DIVISION	MEDIUM	{positive-div-negative}
cmk37a6yp01ifu2l7jhn41eof	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	36 ÷ (-9)	-4	INTEGERS_DIVISION	MEDIUM	{positive-div-negative}
cmk37a6yp01igu2l7t7lwyh0s	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	42 ÷ (-7)	-6	INTEGERS_DIVISION	MEDIUM	{positive-div-negative}
cmk37a6yp01ihu2l7j1omn7dg	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	18 ÷ (-2)	-9	INTEGERS_DIVISION	MEDIUM	{positive-div-negative}
cmk37a6yp01iiu2l768awlm7z	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	40 ÷ (-8)	-5	INTEGERS_DIVISION	MEDIUM	{positive-div-negative}
cmk37a6yp01iju2l7oz1wrvju	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	50 ÷ (-10)	-5	INTEGERS_DIVISION	MEDIUM	{positive-div-negative}
cmk37a6yp01iku2l7kpahepio	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	44 ÷ (-11)	-4	INTEGERS_DIVISION	MEDIUM	{positive-div-negative}
cmk37a6yp01ilu2l7kv6lpjh0	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-12) ÷ 3	-4	INTEGERS_DIVISION	MEDIUM	{negative-div-positive}
cmk37a6yp01imu2l7nd3p2xwm	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-20) ÷ 4	-5	INTEGERS_DIVISION	MEDIUM	{negative-div-positive}
cmk37a6yp01inu2l7sgb5dsji	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-24) ÷ 6	-4	INTEGERS_DIVISION	MEDIUM	{negative-div-positive}
cmk37a6yp01iou2l7x1s5oarx	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-30) ÷ 5	-6	INTEGERS_DIVISION	MEDIUM	{negative-div-positive}
cmk37a6yp01ipu2l7qct63dg0	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-36) ÷ 9	-4	INTEGERS_DIVISION	MEDIUM	{negative-div-positive}
cmk37a6yp01iqu2l70w2duxz3	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-42) ÷ 7	-6	INTEGERS_DIVISION	MEDIUM	{negative-div-positive}
cmk37a6yp01iru2l7dmcln96p	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-18) ÷ 2	-9	INTEGERS_DIVISION	MEDIUM	{negative-div-positive}
cmk37a6yp01isu2l77rnho6e3	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-40) ÷ 8	-5	INTEGERS_DIVISION	MEDIUM	{negative-div-positive}
cmk37a6yp01itu2l7nuhbo2mn	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-50) ÷ 10	-5	INTEGERS_DIVISION	MEDIUM	{negative-div-positive}
cmk37a6yp01iuu2l7e4jjp2vq	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-44) ÷ 11	-4	INTEGERS_DIVISION	MEDIUM	{negative-div-positive}
cmk37a6yp01ivu2l7511cpsdt	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-12) ÷ (-3)	4	INTEGERS_DIVISION	MEDIUM	{negative-div-negative}
cmk37a6yp01iwu2l7kna4yblb	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-20) ÷ (-4)	5	INTEGERS_DIVISION	MEDIUM	{negative-div-negative}
cmk37a6yp01ixu2l7jyl0nsbi	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-24) ÷ (-6)	4	INTEGERS_DIVISION	MEDIUM	{negative-div-negative}
cmk37a6yp01iyu2l7waczas07	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-30) ÷ (-5)	6	INTEGERS_DIVISION	MEDIUM	{negative-div-negative}
cmk37a6yp01izu2l7po5qcepq	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-36) ÷ (-9)	4	INTEGERS_DIVISION	MEDIUM	{negative-div-negative}
cmk37a6yp01j0u2l7kcfsgpv5	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-42) ÷ (-7)	6	INTEGERS_DIVISION	MEDIUM	{negative-div-negative}
cmk37a6yp01j1u2l7arnibudz	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-18) ÷ (-2)	9	INTEGERS_DIVISION	MEDIUM	{negative-div-negative}
cmk37a6yp01j2u2l7373dsjic	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-40) ÷ (-8)	5	INTEGERS_DIVISION	MEDIUM	{negative-div-negative}
cmk37a6yp01j3u2l7qj1b93pu	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-50) ÷ (-10)	5	INTEGERS_DIVISION	MEDIUM	{negative-div-negative}
cmk37a6yp01j4u2l780frahht	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-44) ÷ (-11)	4	INTEGERS_DIVISION	MEDIUM	{negative-div-negative}
cmk37a6yp01j5u2l7ubsulf28	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	0 ÷ 5	0	INTEGERS_DIVISION	MEDIUM	{zero-divided}
cmk37a6yp01j6u2l7jw8f4qsx	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	0 ÷ 7	0	INTEGERS_DIVISION	MEDIUM	{zero-divided}
cmk37a6yp01j7u2l74elxzmuw	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	0 ÷ (-3)	0	INTEGERS_DIVISION	MEDIUM	{zero-divided}
cmk37a6yp01j8u2l7m452iosd	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	0 ÷ (-8)	0	INTEGERS_DIVISION	MEDIUM	{zero-divided}
cmk37a6yp01j9u2l7rgasw7ff	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	6 ÷ 1	6	INTEGERS_DIVISION	MEDIUM	{divide-by-one}
cmk37a6yp01jau2l7my2bhyu9	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	9 ÷ 1	9	INTEGERS_DIVISION	MEDIUM	{divide-by-one}
cmk37a6yp01jbu2l74k9j0nkk	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-5) ÷ 1	-5	INTEGERS_DIVISION	MEDIUM	{divide-by-one}
cmk37a6yp01jcu2l7zbilutvh	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-8) ÷ 1	-8	INTEGERS_DIVISION	MEDIUM	{divide-by-one}
cmk37a6yp01jdu2l7edw0iezf	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	6 ÷ (-1)	-6	INTEGERS_DIVISION	MEDIUM	{divide-by-negative-one}
cmk37a6yp01jeu2l71h3bdam0	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	9 ÷ (-1)	-9	INTEGERS_DIVISION	MEDIUM	{divide-by-negative-one}
cmk37a6yp01jfu2l7k1b6qnpw	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-5) ÷ (-1)	5	INTEGERS_DIVISION	MEDIUM	{divide-by-negative-one}
cmk37a6yp01jgu2l7tos5epqb	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-8) ÷ (-1)	8	INTEGERS_DIVISION	MEDIUM	{divide-by-negative-one}
cmk37a6yp01jhu2l7mlj6a3fr	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-20) ÷ (-2)	10	INTEGERS_DIVISION	MEDIUM	{negative-div-negative}
cmk37a6yp01jiu2l7lwi0hg9j	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	26 ÷ (-2)	-13	INTEGERS_DIVISION	MEDIUM	{positive-div-negative}
cmk37a6yp01jju2l7ycu7qghi	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-60) ÷ 12	-5	INTEGERS_DIVISION	MEDIUM	{negative-div-positive}
cmk37a6yp01jku2l712ulvje2	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 + 3 × 2	11	INTEGERS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6yp01jlu2l74g414ytz	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	10 - 2 × 3	4	INTEGERS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6yp01jmu2l7jqeyc5wg	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	12 ÷ 3 + 4	8	INTEGERS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6yp01jnu2l7i3i6fi78	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	20 ÷ 4 - 2	3	INTEGERS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6yp01jou2l7epp7f8v9	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	6 × 2 + 3	15	INTEGERS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6yp01jqu2l71ivpcqp9	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(10 - 2) × 3	24	INTEGERS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6yp01jru2l78nomf08n	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(12 + 4) ÷ 4	4	INTEGERS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6yq01jsu2l7emvvgyy9	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(20 - 5) ÷ 3	5	INTEGERS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6yq01jtu2l7i2xcsiyd	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(6 + 2) × 4	32	INTEGERS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6yq01juu2l7ka5tqjgd	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) + 5 × 2	7	INTEGERS_ADDITION	HARD	{mixed-operations,negatives}
cmk37a6yq01jvu2l7gg5ioguo	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	8 - (-2) × 3	14	INTEGERS_ADDITION	HARD	{mixed-operations,negatives}
cmk37a6yq01jwu2l7gn0vbf0c	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-12) ÷ 3 + 7	3	INTEGERS_ADDITION	HARD	{mixed-operations,negatives}
cmk37a6yq01jxu2l7t7uxgjkc	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	15 + (-4) × 2	7	INTEGERS_ADDITION	HARD	{mixed-operations,negatives}
cmk37a6yq01jyu2l7svzsyn0a	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-6) × 2 + 15	3	INTEGERS_ADDITION	HARD	{mixed-operations,negatives}
cmk37a6yq01jzu2l7lq140sbu	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	((-3) + 5) × 4	8	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,negatives}
cmk37a6yq01k0u2l7yuic7jdg	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(8 - (-2)) × 2	20	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,negatives}
cmk37a6yq01k1u2l7dxwm61js	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	((-12) + 4) ÷ 2	-4	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,negatives}
cmk37a6yq01k2u2l7sms0rz84	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(15 - (-5)) ÷ 4	5	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,negatives}
cmk37a6yq01k3u2l7vlg7z1ug	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	((-6) + 14) × 2	16	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,negatives}
cmk37a6yq01k4u2l79c2azb80	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	3 + 4 × 2 - 5	6	INTEGERS_ADDITION	HARD	{mixed-operations,three-operations}
cmk37a6yq01k5u2l7dzuewj4k	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	10 - 2 × 3 + 4	8	INTEGERS_ADDITION	HARD	{mixed-operations,three-operations}
cmk37a6yq01k6u2l73qflot63	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	12 ÷ 2 + 3 × 2	12	INTEGERS_ADDITION	HARD	{mixed-operations,three-operations}
cmk37a6yq01k7u2l7ul3advq8	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	20 ÷ 4 - 2 + 3	6	INTEGERS_ADDITION	HARD	{mixed-operations,three-operations}
cmk37a6yq01k8u2l7au71n2vs	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	8 + 6 ÷ 2 - 4	7	INTEGERS_ADDITION	HARD	{mixed-operations,three-operations}
cmk37a6yq01k9u2l7vgzapusu	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) + 4 × 2 - 1	4	INTEGERS_ADDITION	HARD	{mixed-operations,three-operations,negatives}
cmk37a6yq01kau2l7uyw5nyq1	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	10 - (-2) × 3 + 1	17	INTEGERS_ADDITION	HARD	{mixed-operations,three-operations,negatives}
cmk37a6yq01kbu2l7ps1mebdc	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-12) ÷ 3 + 2 × 4	4	INTEGERS_ADDITION	HARD	{mixed-operations,three-operations,negatives}
cmk37a6yq01kcu2l7xpjb3n7r	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	15 + (-4) × 2 - 3	4	INTEGERS_ADDITION	HARD	{mixed-operations,three-operations,negatives}
cmk37a6yq01kdu2l74zvrctfi	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-6) × 2 + 15 - 1	2	INTEGERS_ADDITION	HARD	{mixed-operations,three-operations,negatives}
cmk37a6yq01keu2l7y42nfk2h	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	5 × (3 + 2)	25	INTEGERS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6yq01kfu2l7ukbl5l9s	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	18 ÷ (6 - 3)	6	INTEGERS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6yq01kgu2l7d38p5rvk	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	24 ÷ (2 + 4)	4	INTEGERS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6yq01khu2l7wrlfavte	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	4 × (8 - 3)	20	INTEGERS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6yq01kiu2l7y9lriv17	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	30 ÷ (10 - 5)	6	INTEGERS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6yq01kju2l72d1ilf1k	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) × (4 + 2)	-18	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,negatives}
cmk37a6yq01kku2l7d6a7rkvy	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	20 ÷ ((-2) + 7)	4	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,negatives}
cmk37a6yq01klu2l7wl2innbi	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-24) ÷ (2 + 4)	-4	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,negatives}
cmk37a6yq01kmu2l7wzp1r0tz	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-5) × (8 - 3)	-25	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,negatives}
cmk37a6yq01knu2l7qsqiblni	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	36 ÷ ((-2) + 8)	6	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,negatives}
cmk37a6yq01kou2l7y56cfujf	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-3) × 4 + (-2) × 5	-22	INTEGERS_ADDITION	HARD	{mixed-operations,multiple-negatives}
cmk37a6yq01kpu2l7io1yr4uf	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	8 ÷ (-2) + 12 ÷ 3	0	INTEGERS_ADDITION	HARD	{mixed-operations,multiple-negatives}
cmk37a6yq01kqu2l712y5rxwu	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-6) × 2 + (-3) × 4	-24	INTEGERS_ADDITION	HARD	{mixed-operations,multiple-negatives}
cmk37a6yq01kru2l7pqr7gi64	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	15 ÷ (-3) + 20 ÷ 4	0	INTEGERS_ADDITION	HARD	{mixed-operations,multiple-negatives}
cmk37a6yq01ksu2l751npcboh	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-4) × 3 + (-2) × 6	-24	INTEGERS_ADDITION	HARD	{mixed-operations,multiple-negatives}
cmk37a6yq01ktu2l7oidzx31k	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	2 × (5 - 8)	-6	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,result-negative}
cmk37a6yq01kuu2l7ujjivswg	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	18 ÷ (3 - 6)	-6	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,result-negative}
cmk37a6yq01kwu2l7dyx1rl71	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	24 ÷ (4 - 10)	-4	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,result-negative}
cmk37a6yq01kxu2l7a6ygrfxt	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	3 × (6 - 11)	-15	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,result-negative}
cmk37a6z201kyu2l7fjfr3wom	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 5 = 12	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201kzu2l7u5bilmbm	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 8 = 15	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201l0u2l71ls1c3bh	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 3 = 10	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201l1u2l70j53vrvj	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 6 = 14	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201l2u2l78hhp7a3t	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 9 = 20	x = 11	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201l3u2l7k6vsazo9	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 4 = 13	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201l4u2l7y74e4t8x	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 7 = 18	x = 11	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201l5u2l7n6eurobx	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 11 = 25	x = 14	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201l6u2l7oy5nnb6y	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 12 = 30	x = 18	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201l7u2l7knzk44da	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 15 = 28	x = 13	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201l8u2l7yvofbgss	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 5 = 8	x = 13	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201l9u2l7kaow0y8m	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 3 = 7	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201lau2l7j1lmzfyw	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 4 = 9	x = 13	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201lbu2l7qg56407p	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 6 = 12	x = 18	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201lcu2l7kfx7uofr	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 8 = 15	x = 23	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201ldu2l7ilsk7ojw	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 7 = 11	x = 18	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201leu2l7omqmzutw	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 9 = 14	x = 23	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201lfu2l7rdor0xcx	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 10 = 20	x = 30	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201lgu2l7uqux92nn	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 12 = 18	x = 30	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201lhu2l79dftvaqs	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 11 = 22	x = 33	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201liu2l7gdcutdga	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	7 + x = 15	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition,variable-on-right}
cmk37a6z201lju2l7b9yol5kd	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5 + x = 12	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition,variable-on-right}
cmk37a6z201lku2l7s1ss341o	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	9 + x = 20	x = 11	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition,variable-on-right}
cmk37a6z201llu2l75q8845yb	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4 + x = 13	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition,variable-on-right}
cmk37a6z201lmu2l756wsdgt7	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6 + x = 18	x = 12	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition,variable-on-right}
cmk37a6z201lnu2l7qbitswtp	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	12 + x = 25	x = 13	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition,variable-on-right}
cmk37a6z201lou2l7vw4z0z1p	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	8 + x = 22	x = 14	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition,variable-on-right}
cmk37a6z201lpu2l7y89jftck	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	11 + x = 28	x = 17	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition,variable-on-right}
cmk37a6z201lqu2l7mw4ixw7y	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	15 + x = 30	x = 15	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition,variable-on-right}
cmk37a6z201lru2l73a0m3cff	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	13 + x = 27	x = 14	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition,variable-on-right}
cmk37a6z201lsu2l7ux1m2qno	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	20 - x = 12	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction,variable-on-right}
cmk37a6z201ltu2l74jr0zear	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	15 - x = 7	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction,variable-on-right}
cmk37a6z201luu2l7vk9ol3by	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	18 - x = 10	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction,variable-on-right}
cmk37a6z201lvu2l71yyu5v7h	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	25 - x = 13	x = 12	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction,variable-on-right}
cmk37a6z201lwu2l7g3xu0q94	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	30 - x = 18	x = 12	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction,variable-on-right}
cmk37a6z201lxu2l7t0s2tyam	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	22 - x = 15	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction,variable-on-right}
cmk37a6z201lyu2l7rvy19hv8	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	28 - x = 19	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction,variable-on-right}
cmk37a6z201lzu2l7j77ewcit	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	35 - x = 20	x = 15	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction,variable-on-right}
cmk37a6z201m0u2l7wps9op52	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	40 - x = 25	x = 15	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction,variable-on-right}
cmk37a6z201m1u2l7yzd38hxb	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	33 - x = 21	x = 12	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction,variable-on-right}
cmk37a6z201m3u2l76l7bq1an	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 1 = 8	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201m4u2l7soiqrbcz	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 2 = 6	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201m5u2l7h34td0y9	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 1 = 9	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201m6u2l70fd7w0tt	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 10 = 23	x = 13	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201m7u2l7eea02gcl	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 14 = 27	x = 13	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201m8u2l72j34v1jc	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 13 = 17	x = 30	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201m9u2l7jmij23s6	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x - 15 = 25	x = 40	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,subtraction}
cmk37a6z201mau2l7ky4f7mo4	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3 + x = 14	x = 11	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition,variable-on-right}
cmk37a6z201mbu2l78tqi1ji4	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	10 + x = 24	x = 14	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition,variable-on-right}
cmk37a6z201mcu2l7ppwfi6ws	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x = 10	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mdu2l7wn9vq5zx	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x = 15	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201meu2l7yr2dau7r	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x = 20	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mfu2l79cduvlsu	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x = 25	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mgu2l73f1yxr15	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6x = 30	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mhu2l7l76j3kfs	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x = 14	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201miu2l794ztkmvt	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x = 21	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mju2l7gpti3edl	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x = 28	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mku2l7jqmhs6tk	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x = 35	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mlu2l7ev54x9wm	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	7x = 49	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mmu2l7x48vx54i	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x = 18	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mnu2l7mektoy57	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x = 27	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mou2l7colyqo1e	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x = 36	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mpu2l7a9tavh72	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6x = 54	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mqu2l7wg17jsz1	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	8x = 72	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mru2l7vvuq68iy	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x = 16	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201msu2l7sdj7qxss	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x = 24	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mtu2l7tq6mnud8	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x = 32	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201muu2l7oxv5a9yk	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x = 40	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mvu2l73v0ezb8e	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	7x = 56	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mwu2l7sa09pm9f	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	9x = 63	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mxu2l7azt4yeza	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	9x = 81	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201myu2l7um7hww14	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	10x = 50	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201mzu2l7jvm0xopp	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	10x = 70	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201n0u2l7ezwftpag	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	10x = 90	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,multiplication}
cmk37a6z201n1u2l7n4mawkme	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/2 = 5	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201n2u2l79dd0nema	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/3 = 4	x = 12	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201n3u2l77aphctnf	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/4 = 3	x = 12	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201n4u2l712j1inud	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/5 = 2	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201n5u2l7ztf5x5wi	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/2 = 7	x = 14	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201n6u2l7i0b0toe2	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/3 = 6	x = 18	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201n7u2l74snxr88n	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/4 = 5	x = 20	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201n8u2l7c68ivvn1	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/5 = 4	x = 20	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201n9u2l7pzs7x2ih	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/6 = 3	x = 18	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201nau2l7iqrk9gg7	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/2 = 9	x = 18	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201ncu2l7j8x44l9n	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/4 = 6	x = 24	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201ndu2l7bvcuzkw3	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/5 = 6	x = 30	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201neu2l7m4kvevzf	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/6 = 5	x = 30	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201nfu2l7ydk79rrc	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/7 = 4	x = 28	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201ngu2l7iwrff8sn	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/8 = 3	x = 24	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201nhu2l73ayde70w	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/2 = 10	x = 20	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201niu2l7vgb9rspx	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/3 = 10	x = 30	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201nju2l7c5uoboua	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/4 = 7	x = 28	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201nku2l7n1ybyday	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/5 = 8	x = 40	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201nlu2l74g330a42	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/6 = 6	x = 36	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201nmu2l7y8n0daqp	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/7 = 5	x = 35	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201nnu2l7arcu226l	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/8 = 4	x = 32	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201nou2l7991fsvr5	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/9 = 4	x = 36	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201npu2l73s0hyik6	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/10 = 5	x = 50	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z201nqu2l7s9qiypgk	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x + 5 = 13	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z201nru2l7pvkqhjcy	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x + 7 = 19	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z201nsu2l77wnmskai	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x + 3 = 19	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z201ntu2l7mhdoudph	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x + 2 = 22	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z201nuu2l7idfr088n	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x + 9 = 17	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z201nvu2l7uylzb5su	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x + 4 = 16	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z201nwu2l7xscda8vq	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x + 5 = 21	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z201nxu2l7q5b5lv1i	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x + 7 = 27	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z201nyu2l7s6yj3jx1	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6x + 3 = 27	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z201nzu2l7q7inm0co	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	7x + 2 = 30	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z201o0u2l7rm7so07x	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x - 3 = 9	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z201o1u2l7eyxklaqg	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x - 5 = 13	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z201o2u2l7q64ytwu1	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x - 7 = 17	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301o3u2l797tzy08b	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x - 9 = 21	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301o4u2l72l55ueot	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x - 1 = 11	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301o5u2l7phjt3b02	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x - 2 = 16	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301o6u2l7tqcwdapv	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x - 3 = 21	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301o7u2l7rz8t3srn	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x - 4 = 26	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301o8u2l7wrrz1al1	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6x - 5 = 31	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301o9u2l7lx9tq9nj	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	7x - 8 = 34	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301oau2l7s23w515z	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x + 11 = 25	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301obu2l71ttk8lpx	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x + 8 = 29	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301ocu2l7qb83tudg	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x + 6 = 34	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301odu2l77oerxifl	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x + 9 = 44	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301oeu2l7eazqoqag	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x - 5 = 9	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301ofu2l7cfnnxf45	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x - 7 = 14	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301ogu2l73jlxi2il	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x - 9 = 19	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301ohu2l7mrq10g3t	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x - 11 = 24	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301oiu2l7zxevi09d	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6x - 13 = 29	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301oju2l7b72ocz57	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	7x - 15 = 34	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301oku2l78v379asb	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x + 6 = 20	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301omu2l7a5gutn00	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x + 8 = 36	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301onu2l7fczxijwv	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	8x + 5 = 45	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301oou2l7optcyp6s	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	9x + 7 = 52	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301opu2l7rxce2zg5	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	10x + 3 = 53	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301oqu2l7605qrpcm	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	8x - 7 = 33	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301oru2l7u6ylq2x0	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	9x - 5 = 40	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301osu2l77wrunk4c	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	10x - 8 = 42	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301otu2l7tu20koxn	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x + 8 = 24	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301ouu2l7r8gjldyu	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x + 6 = 30	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301ovu2l7yrygv8d4	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x + 4 = 36	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301owu2l7jd21zqjm	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x + 5 = 45	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301oxu2l7105r4701	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x - 4 = 12	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301oyu2l7w9cdfs2b	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x - 6 = 18	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301ozu2l7rmohs017	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x - 8 = 24	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301p0u2l76zn9v222	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x - 10 = 30	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301p1u2l7d4xr2emn	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6x - 12 = 36	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301p2u2l74r1ndmao	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	7x - 14 = 42	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301p3u2l7fmmkk83b	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x + 12 = 30	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301p4u2l7zbvdc9so	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x + 9 = 36	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301p5u2l7eupm03n8	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x + 7 = 43	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301p6u2l7d5epmb9z	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x + 8 = 53	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301p7u2l78g2bfgzg	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x - 7 = 11	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301p8u2l7basepopk	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x - 8 = 19	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301p9u2l7ytek8bba	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x - 9 = 27	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301pau2l7n9ktuyc6	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x - 11 = 34	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301pbu2l7d806a0fw	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6x - 13 = 41	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301pcu2l767xwz1gz	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	7x - 16 = 47	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301pdu2l7s9y9gr9i	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x + 1 = 21	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301peu2l7m8ltvxk3	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x + 2 = 32	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301pfu2l7kv1nft0c	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x + 3 = 43	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301pgu2l77ydp0fle	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x + 4 = 54	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301phu2l7e6kmry6o	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2x - 6 = 14	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301piu2l7txg2mugb	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x - 9 = 21	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301pju2l7gddx9zb7	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4x - 12 = 28	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301pku2l7l76xidd1	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5x - 15 = 35	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301plu2l71pdqd5c7	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6x - 18 = 42	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301pmu2l7arz4kw36	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	7x - 20 = 50	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301pnu2l7jr7yv3is	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	8x - 24 = 56	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301pou2l7jhlekb55	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	9x - 27 = 63	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301ppu2l7kfarymm1	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	10x - 30 = 70	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301pqu2l7k0huky5a	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	11x - 33 = 77	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301pru2l780mhtr3h	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	12x - 36 = 84	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,subtraction}
cmk37a6z301psu2l7xx5p68q7	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4(x + 2) = 20	x = 3	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301ptu2l7jsz513wp	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3(x + 5) = 24	x = 3	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301puu2l7g1augfbb	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2(x + 7) = 20	x = 3	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301pvu2l7jzx8h1xe	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5(x + 1) = 20	x = 3	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301pwu2l7zvfbfj20	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4(x - 1) = 16	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301pxu2l7wqzgxtk6	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3(x - 2) = 15	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301pyu2l75a4lr1kj	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2(x - 3) = 10	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301pzu2l7n6k5s86d	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5(x - 4) = 25	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301q0u2l7dwaydyfp	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6(x - 2) = 24	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301q1u2l7p1sptv1i	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	7(x + 3) = 42	x = 3	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301q2u2l7209sol70	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4(x + 3) = 28	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301q3u2l7vilp3fs2	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3(x + 4) = 27	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301q4u2l7hgidt9ia	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2(x + 6) = 24	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301q5u2l7177ng1qy	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5(x + 2) = 35	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301q6u2l7cddmdmhv	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4(x - 3) = 20	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301q7u2l779r5jv37	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3(x - 4) = 18	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301q8u2l7m5vsp9fi	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2(x - 5) = 14	x = 12	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301q9u2l7qpypeey7	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5(x - 3) = 30	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301qau2l7o0vladwi	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6(x + 4) = 48	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301qbu2l7wd61xlxl	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	7(x - 1) = 35	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301qcu2l7k3ozhuqv	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2(2x + 3) = 22	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301qdu2l76df3vw06	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3(2x + 1) = 21	x = 3	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301qeu2l78tvw7ak1	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4(2x - 1) = 28	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301qfu2l754sw824b	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2(3x + 2) = 26	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301qgu2l7zjls35yb	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3(3x - 2) = 33	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301qhu2l7y68i32p1	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2(2x - 3) = 14	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301qiu2l7pjgf032j	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4(2x + 3) = 44	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301qju2l79hl7bkv8	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5(2x - 1) = 35	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301qku2l7m9xuevhb	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2(4x + 1) = 34	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301qlu2l7q8eiwqwf	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3(4x - 2) = 42	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301qmu2l7qcfcsbhd	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	8(x + 1) = 40	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301qnu2l767qtsjft	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	9(x - 2) = 45	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301qou2l70ctn9cqk	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	10(x + 3) = 70	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301qpu2l7jq49jcr3	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4(x + 5) = 40	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301qqu2l72cjl8w5k	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3(x + 6) = 33	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301qru2l7gldbtfl3	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2(x + 8) = 26	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301qsu2l7f98dkv1y	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5(x - 2) = 20	x = 6	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301qtu2l7sqx660b8	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6(x - 3) = 30	x = 8	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301quu2l764lgrqty	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	7(x - 4) = 35	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301qvu2l7gafnj7ya	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	8(x - 5) = 40	x = 10	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law}
cmk37a6z301qwu2l7b71thjy7	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2(3x + 4) = 32	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301qxu2l77007eata	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3(2x - 3) = 21	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301qyu2l7cdm5mhj6	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4(3x - 4) = 44	x = 5	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301r0u2l7qedr93dz	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	6(2x - 3) = 30	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301r1u2l7xxgjpmec	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	2(5x + 1) = 42	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301r2u2l7qz79xrny	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3(4x + 1) = 51	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301r3u2l7je1nlyzv	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	4(3x + 2) = 56	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301r4u2l7z38m8jpj	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5(3x - 1) = 55	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6z301r5u2l7am3kzw5z	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3(5x - 2) = 54	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6zm01r6u2l7e12amlbe	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 2x + 3?	3	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01r7u2l76o1lce3h	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient (slope) of y = 5x + 1?	5	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zm01r8u2l7q5nsn5r0	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = x - 4?	-4	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01r9u2l7r8gduj1x	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -3x + 7?	-3	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form,negative-slope}
cmk37a6zm01rau2l7808rhe21	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 4x + 2, what is y when x = 0?	2	LINEAR_GRAPHING	EASY	{substitution,y-intercept}
cmk37a6zm01rbu2l7cqaseqji	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = -2x + 5?	5	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01rcu2l7hce4hedm	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 3x?	3	LINEAR_GRAPHING	EASY	{gradient,through-origin}
cmk37a6zm01rdu2l7spq0w6u4	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = x + 1, what is y when x = 5?	6	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zm01reu2l7nbvgyv1o	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 6x - 2?	-2	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01rfu2l7br4yk10w	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -x + 4?	-1	LINEAR_GRAPHING	EASY	{gradient,negative-slope}
cmk37a6zm01rgu2l7n40n9w4u	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 2x + 3, what is y when x = 1?	5	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zm01rhu2l7u2n291w8	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 7x + 8?	8	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01riu2l77vsukoy1	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -5x - 3?	-5	LINEAR_GRAPHING	EASY	{gradient,negative-slope}
cmk37a6zm01rju2l7bun91h8t	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 3x - 1, what is y when x = 2?	5	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zm01rku2l7ppwfl7kk	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = x + 6?	6	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01rlu2l7t6isrsw1	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 4x - 2?	4	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zm01rmu2l7d94dn43p	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 5x, what is y when x = 3?	15	LINEAR_GRAPHING	EASY	{substitution,through-origin}
cmk37a6zm01rnu2l7yutsuz9o	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = -4x + 10?	10	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01rou2l7g30wb0kd	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 2x + 9?	2	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zm01rpu2l7l404kq78	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = -x + 8, what is y when x = 3?	5	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zm01rqu2l7f16vmxjp	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 3x - 7?	-7	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01rru2l7ny7jwvnx	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -2x?	-2	LINEAR_GRAPHING	EASY	{gradient,through-origin,negative-slope}
cmk37a6zm01rsu2l7e37vd5qx	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 4x + 5, what is y when x = 0?	5	LINEAR_GRAPHING	EASY	{substitution,y-intercept}
cmk37a6zm01rtu2l7j9860bcl	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 8x + 1?	1	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01ruu2l7mrmp6x8d	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = x - 5?	1	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zm01rvu2l7c345qtnn	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 2x - 4, what is y when x = 4?	4	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zm01rwu2l7u7fji8t7	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = -3x - 2?	-2	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01rxu2l7bfeb5sre	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 6x + 4?	6	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zm01ryu2l7wp9x548l	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = -2x + 10, what is y when x = 5?	0	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zm01rzu2l71axc1961	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 5x?	0	LINEAR_GRAPHING	EASY	{y-intercept,through-origin}
cmk37a6zm01s0u2l7cvljkawo	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -4x + 6?	-4	LINEAR_GRAPHING	EASY	{gradient,negative-slope}
cmk37a6zm01s2u2l7zaw61e05	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 2x - 8?	-8	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01s3u2l7a319aoc3	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 7x - 1?	7	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zm01s4u2l75cvjloen	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = x + 4, what is y when x = 6?	10	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zm01s5u2l76k78peqg	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = -x - 3?	-3	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01s6u2l7v8vkk0p3	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 9x + 2?	9	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zm01s7u2l750bwnifk	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 5x - 3, what is y when x = 2?	7	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zm01s8u2l7xbxhyiuo	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 4x + 7?	7	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01s9u2l7d4z9cuf2	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -6x + 3?	-6	LINEAR_GRAPHING	EASY	{gradient,negative-slope}
cmk37a6zm01sau2l7x1x5eh1k	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = -3x + 9, what is y when x = 3?	0	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zm01sbu2l74ydb6e4l	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = x?	0	LINEAR_GRAPHING	EASY	{y-intercept,through-origin}
cmk37a6zm01scu2l7twn07e9z	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 3x + 8?	3	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zm01sdu2l7pl9xaqic	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 6x + 1, what is y when x = 1?	7	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zm01seu2l7tuoq3jz5	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = -5x + 12?	12	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01sfu2l7sj4pd4hf	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 2x - 3?	2	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zm01sgu2l71r8anci4	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 4x - 2, what is y when x = 5?	18	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zm01shu2l74afehdfl	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 9x - 4?	-4	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zm01siu2l7g68vg5wm	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -7x + 5?	-7	LINEAR_GRAPHING	EASY	{gradient,negative-slope}
cmk37a6zn01sju2l7gf8r7tr6	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 2x + 1, what is y when x = 4?	9	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01sku2l7je6onblk	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 6x + 9?	9	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01slu2l7n7m5wi12	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -x + 7?	-1	LINEAR_GRAPHING	EASY	{gradient,negative-slope}
cmk37a6zn01smu2l7u0t448or	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 3x, what is y when x = 4?	12	LINEAR_GRAPHING	EASY	{substitution,through-origin}
cmk37a6zn01snu2l7ogv8l2gl	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = -2x - 6?	-6	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01sou2l7wvv7frph	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 5x - 4?	5	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zn01spu2l7xu4nvkzh	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = -4x + 12, what is y when x = 3?	0	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01squ2l7byj061ey	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 7x + 3?	3	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01sru2l7tniszpeg	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = x + 2?	1	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zn01ssu2l7bzpl1kbe	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 8x - 1, what is y when x = 2?	15	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01stu2l7puxld6a3	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = -3x?	0	LINEAR_GRAPHING	EASY	{y-intercept,through-origin}
cmk37a6zn01suu2l7zvgyz3no	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 4x + 6?	4	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zn01svu2l7saxlok0i	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = -x - 2, what is y when x = 4?	-6	LINEAR_GRAPHING	EASY	{substitution,evaluation,negative}
cmk37a6zn01swu2l7qvn4p4hs	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 3x + 5?	5	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01sxu2l72px7d9j9	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -8x - 1?	-8	LINEAR_GRAPHING	EASY	{gradient,negative-slope}
cmk37a6zn01syu2l70lgn2kw1	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 7x + 2, what is y when x = 1?	9	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01szu2l74q792lgz	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 2x + 4?	4	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01t0u2l71j9jvugx	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -2x + 8?	-2	LINEAR_GRAPHING	EASY	{gradient,negative-slope}
cmk37a6zn01t1u2l7ms0wrbas	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 5x + 3, what is y when x = 2?	13	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01t2u2l70qi359xk	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 10x - 5?	-5	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01t3u2l7xba2qcz9	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = x - 1?	1	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zn01t5u2l78gyf2hdk	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = -6x + 15?	15	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01t6u2l70o4cl7j2	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 8x + 7?	8	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zn01t7u2l7aw3ba5o1	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = -5x + 20, what is y when x = 4?	0	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01t8u2l75xiiiyni	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 4x - 3?	-3	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01t9u2l7jh6hi2m5	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -9x + 4?	-9	LINEAR_GRAPHING	EASY	{gradient,negative-slope}
cmk37a6zn01tau2l700w3y1k4	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 6x - 5, what is y when x = 3?	13	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01tbu2l75ty1d4l2	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = x + 8?	8	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01tcu2l7jjjg0hi4	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 2x + 7?	2	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zn01tdu2l70ypzt9p5	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = -2x - 3, what is y when x = 2?	-7	LINEAR_GRAPHING	EASY	{substitution,evaluation,negative}
cmk37a6zn01teu2l7y6295k9u	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 5x + 6?	6	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01tfu2l7wq6kbvk4	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -3x + 11?	-3	LINEAR_GRAPHING	EASY	{gradient,negative-slope}
cmk37a6zn01tgu2l7zoentk7a	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 10x - 4, what is y when x = 1?	6	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01thu2l7iny7xgx8	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = -7x - 5?	-5	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01tiu2l7vput4h6p	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 3x - 2?	3	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zn01tju2l7bq5vevy8	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 4x + 8, what is y when x = 2?	16	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01tku2l7auem5vzs	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = -x + 10?	10	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01tlu2l7384ni562	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 6x - 7?	6	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zn01tmu2l77ypo3d4t	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = -6x + 18, what is y when x = 3?	0	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01tnu2l79rm2shee	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 8x?	0	LINEAR_GRAPHING	EASY	{y-intercept,through-origin}
cmk37a6zn01tou2l7vpmp2a4b	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = -4x - 8?	-4	LINEAR_GRAPHING	EASY	{gradient,negative-slope}
cmk37a6zn01tpu2l7k63mtgxg	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 7x - 6, what is y when x = 2?	8	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01tqu2l7ledju2wh	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 9x + 11?	11	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01tru2l70dwcao5b	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = x + 9?	1	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zn01tsu2l7spt53ufz	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = -8x + 24, what is y when x = 3?	0	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01ttu2l7nmv2mmeu	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 2x - 10?	-10	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zn01tuu2l7q7nwlvak	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 5x + 10?	5	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zn01tvu2l7wo19lijn	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 3x + 6, what is y when x = 0?	6	LINEAR_GRAPHING	EASY	{substitution,y-intercept}
cmk37a6zn01twu2l7uvcafeof	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (0, 2) and (1, 5).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01txu2l719f5g9nz	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (2, 3) and (4, 7).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01tyu2l7x5d243m7	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 4 and y-intercept 1.	y = 4x + 1	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01tzu2l76o4lp5ff	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -2 and y-intercept 5.	y = -2x + 5	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a6zn01u0u2l7hzoo1u0m	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 2x - 6.	3	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01u1u2l7jk70m9gp	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 3x + 9.	-3	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01u2u2l7i65s9mmn	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (1, 4) and (3, 10).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01u3u2l7jrhlnity	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 1 and y-intercept -3.	y = x - 3	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01u4u2l723ke5wha	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = -4x + 8.	2	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01u5u2l7rpn8x7yu	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (0, 0) and (5, 15).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points,through-origin}
cmk37a6zn01u7u2l7wvnbyfn5	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 5x - 10.	2	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01u8u2l720yyayju	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (-1, 2) and (1, 6).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points,negative-coordinates}
cmk37a6zn01u9u2l7034b1z4a	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -1 and y-intercept 7.	y = -x + 7	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a6zn01uau2l7ifpneajz	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = -2x - 4.	-2	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation,negative}
cmk37a6zn01ubu2l70x29tvu3	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (3, 1) and (5, 5).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01ucu2l7cjq9sowd	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 5 and y-intercept -2.	y = 5x - 2	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01udu2l7qq0awv3j	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 4x + 12.	-3	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01ueu2l7bwnl5jfo	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (0, 5) and (2, 11).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01ufu2l788bfsao0	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -3 and y-intercept 4.	y = -3x + 4	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a6zn01ugu2l7r2wptzxi	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 6x - 18.	3	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01uhu2l79zxn8fs4	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (2, 1) and (6, 9).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01uiu2l7gdn1ljlk	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 2 and y-intercept 8.	y = 2x + 8	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01uju2l7kifnkzof	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = -3x + 12.	4	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01uku2l7k74m9zms	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (1, 1) and (4, 7).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01ulu2l7e2b82o5l	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 6 and y-intercept -5.	y = 6x - 5	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01umu2l7jd5jvd2i	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 7x + 14.	-2	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01unu2l7q6lk8vk6	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (0, -3) and (3, 6).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points,negative-coordinates}
cmk37a6zn01uou2l79cfr249z	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -5 and y-intercept 10.	y = -5x + 10	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a6zn01upu2l7onoaww19	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = -6x - 12.	-2	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation,negative}
cmk37a6zn01uqu2l7d7f9350o	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (5, 2) and (7, 8).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01uru2l7o7dfs5et	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 7 and y-intercept 3.	y = 7x + 3	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01usu2l7cnd3ghtm	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 8x - 24.	3	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01utu2l7cckyh2nu	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (2, 5) and (4, 11).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01uuu2l7ytiwx8wc	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -4 and y-intercept 12.	y = -4x + 12	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a6zn01uvu2l71jl7j1ga	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 9x + 27.	-3	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01uwu2l7w1bddqpp	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (0, 1) and (4, 9).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01uxu2l7539rcgnx	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 8 and y-intercept -4.	y = 8x - 4	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01uyu2l7rlviw7y7	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = -7x + 21.	3	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01uzu2l71x6visfc	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (3, 4) and (6, 10).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01v0u2l700hkjk7y	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -6 and y-intercept 9.	y = -6x + 9	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a6zn01v1u2l71rv3eyyu	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 10x - 50.	5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01v2u2l7a27rplvu	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (1, 3) and (5, 11).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01v3u2l75jc7e62j	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 9 and y-intercept 0.	y = 9x	LINEAR_GRAPHING	MEDIUM	{write-equation,through-origin}
cmk37a6zn01v4u2l7ygjap7zs	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = -8x - 16.	-2	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation,negative}
cmk37a6zn01v6u2l73l8bvowz	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 10 and y-intercept -1.	y = 10x - 1	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01v7u2l7s71nukv0	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 2x + 10.	-5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01v8u2l7f318x9j7	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (4, 2) and (7, 8).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01v9u2l789rnxikc	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -7 and y-intercept 14.	y = -7x + 14	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a6zn01vau2l7xzym15ws	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 3x - 15.	5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01vbu2l74su9cap5	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (2, 0) and (5, 9).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01vcu2l7bz53vmxs	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 4 and y-intercept 6.	y = 4x + 6	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01vdu2l7saule8ga	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = -5x + 25.	5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01veu2l7gjb4a65h	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (1, 2) and (6, 12).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01vfu2l74mlzlt5d	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -8 and y-intercept 16.	y = -8x + 16	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a6zn01vgu2l7yobdqdw9	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 4x + 16.	-4	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01vhu2l7o0s8c2o0	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (0, 6) and (2, 12).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01viu2l79ptcvy5g	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 3 and y-intercept 7.	y = 3x + 7	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01vju2l7nf1va635	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = -9x - 27.	-3	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation,negative}
cmk37a6zn01vku2l7qg3mhvzs	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (3, 3) and (8, 13).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01vlu2l7bpxzdste	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 5 and y-intercept 11.	y = 5x + 11	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01vmu2l7aysa1uct	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 6x - 30.	5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01vnu2l7sayh2clv	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (0, 0) and (4, 12).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points,through-origin}
cmk37a6zn01vou2l7jdmnotnp	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -9 and y-intercept 18.	y = -9x + 18	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a6zn01vpu2l763h35gvc	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 5x + 20.	-4	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01vqu2l7uu1z5gxr	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (5, 1) and (8, 7).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01vru2l7qlikruc8	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 2 and y-intercept -6.	y = 2x - 6	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01vsu2l7k56yanbl	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = -10x + 50.	5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01vtu2l7cwenoyhn	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (2, 4) and (7, 14).	2	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01vuu2l7g6rcbpue	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -2 and y-intercept 20.	y = -2x + 20	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a6zn01vvu2l7pvg6n4n6	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 7x + 35.	-5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zn01vwu2l7ogrc692k	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (1, 5) and (4, 14).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zn01vxu2l7n133ism2	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 6 and y-intercept -9.	y = 6x - 9	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zn01vyu2l7hb7yg0ja	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = -4x - 20.	-5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation,negative}
cmk37a6zn01vzu2l795ckbdn7	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (0, 5) with gradient 2.	y = 2x + 5	LINEAR_GRAPHING	HARD	{point-slope,y-intercept-given}
cmk37a6zn01w0u2l7txyizzd0	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (1, 7) with gradient 3.	y = 3x + 4	LINEAR_GRAPHING	HARD	{point-slope}
cmk37a6zn01w1u2l7bq315k66	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (2, 1) and (4, 5).	y = 2x - 3	LINEAR_GRAPHING	HARD	{two-points,find-equation}
cmk37a6zn01w2u2l7phd4xxq2	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A line passes through (-1, 5) and (1, 9). Find its equation.	y = 2x + 7	LINEAR_GRAPHING	HARD	{two-points,find-equation}
cmk37a6zn01w3u2l75l099oo7	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of a line parallel to y = 4x + 3?	4	LINEAR_GRAPHING	HARD	{parallel-lines}
cmk37a6zo01w5u2l7m4pit933	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (0, -2) with gradient 5.	y = 5x - 2	LINEAR_GRAPHING	HARD	{point-slope,y-intercept-given}
cmk37a6zo01w6u2l7j98w1xnm	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (3, 11) with gradient 2.	y = 2x + 5	LINEAR_GRAPHING	HARD	{point-slope}
cmk37a6zo01w7u2l7ey2qu1hk	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A car travels at 60 km/h. Write an equation for distance d after t hours.	d = 60t	LINEAR_GRAPHING	HARD	{real-world,rate}
cmk37a6zo01w8u2l7b25o7g6p	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (1, 3) and (5, 11).	y = 2x + 1	LINEAR_GRAPHING	HARD	{two-points,find-equation}
cmk37a6zo01w9u2l7ag8f7ohw	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A water tank holds 200L and drains at 5L/min. Write an equation for volume V after t minutes.	V = 200 - 5t	LINEAR_GRAPHING	HARD	{real-world,decreasing}
cmk37a6zo01wau2l7u1v97rt9	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (2, 8) with gradient 3.	y = 3x + 2	LINEAR_GRAPHING	HARD	{point-slope}
cmk37a6zo01wbu2l7otxbml9g	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (0, 3) and (4, 15).	y = 3x + 3	LINEAR_GRAPHING	HARD	{two-points,find-equation}
cmk37a6zo01wcu2l7r4j567ey	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of a line parallel to y = 7x - 2?	7	LINEAR_GRAPHING	HARD	{parallel-lines}
cmk37a6zo01wdu2l7hk7mi0ck	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A mobile phone plan costs $20 plus $0.50 per minute. Write an equation for cost C after m minutes.	C = 20 + 0.5m	LINEAR_GRAPHING	HARD	{real-world,linear-cost}
cmk37a6zo01weu2l7g3igg9s5	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (-2, 3) and (2, 11).	y = 2x + 7	LINEAR_GRAPHING	HARD	{two-points,find-equation,negative-coordinates}
cmk37a6zo01wfu2l7c5w9xlht	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (0, -4) with gradient -2.	y = -2x - 4	LINEAR_GRAPHING	HARD	{point-slope,y-intercept-given,negative-slope}
cmk37a6zo01wgu2l7vxli8vf4	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (4, 5) with gradient 1.	y = x + 1	LINEAR_GRAPHING	HARD	{point-slope}
cmk37a6zo01whu2l7dkjc1py3	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of a line parallel to y = -5x + 1?	-5	LINEAR_GRAPHING	HARD	{parallel-lines,negative-slope}
cmk37a6zo01wiu2l70wh4g2y4	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A gym membership costs $50 to join plus $30 per month. Write an equation for total cost C after n months.	C = 50 + 30n	LINEAR_GRAPHING	HARD	{real-world,linear-cost}
cmk37a6zo01wju2l7by3npyw8	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (3, 2) and (7, 10).	y = 2x - 4	LINEAR_GRAPHING	HARD	{two-points,find-equation}
cmk37a6zo01wku2l7gyjn37k3	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (5, 13) with gradient 2.	y = 2x + 3	LINEAR_GRAPHING	HARD	{point-slope}
cmk37a6zo01wlu2l77i55apy8	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of a line parallel to y = 6x + 8?	6	LINEAR_GRAPHING	HARD	{parallel-lines}
cmk37a6zo01wmu2l7olzvlcoa	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A candle is 20cm tall and burns at 2cm/hour. Write an equation for height h after t hours.	h = 20 - 2t	LINEAR_GRAPHING	HARD	{real-world,decreasing}
cmk37a6zo01wnu2l7sz98s7ir	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (0, 8) and (2, 14).	y = 3x + 8	LINEAR_GRAPHING	HARD	{two-points,find-equation}
cmk37a6zo01wou2l7blg8o1nj	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (-1, 2) with gradient 4.	y = 4x + 6	LINEAR_GRAPHING	HARD	{point-slope,negative-coordinates}
cmk37a6zo01wpu2l7ttmebxpe	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of a line parallel to y = -8x - 3?	-8	LINEAR_GRAPHING	HARD	{parallel-lines,negative-slope}
cmk37a6zo01wqu2l75abv9nn0	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A plant is 5cm tall and grows 3cm per week. Write an equation for height h after w weeks.	h = 5 + 3w	LINEAR_GRAPHING	HARD	{real-world,growth}
cmk37a6zo01wru2l7sjaz4xbf	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (1, 4) and (3, 10).	y = 3x + 1	LINEAR_GRAPHING	HARD	{two-points,find-equation}
cmk37a6zo01wsu2l7gd6s4yxd	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (2, 3) with gradient -1.	y = -x + 5	LINEAR_GRAPHING	HARD	{point-slope,negative-slope}
cmk37a6zo01wtu2l7rkoq4727	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A taxi charges $5 flag fall plus $2 per km. Write an equation for cost C after k km.	C = 5 + 2k	LINEAR_GRAPHING	HARD	{real-world,linear-cost}
cmk37a6zo01wuu2l7n0p7g1pg	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (0, -1) and (3, 8).	y = 3x - 1	LINEAR_GRAPHING	HARD	{two-points,find-equation}
cmk37a6zo01wvu2l77ph96394	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of a line parallel to y = 9x?	9	LINEAR_GRAPHING	HARD	{parallel-lines,through-origin}
cmk37a6zo01wwu2l7s9yrtdjj	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (6, 17) with gradient 2.	y = 2x + 5	LINEAR_GRAPHING	HARD	{point-slope}
cmk37a6zo01wxu2l7gvjcn1ro	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A savings account starts with $100 and earns $15 per week. Write an equation for balance B after w weeks.	B = 100 + 15w	LINEAR_GRAPHING	HARD	{real-world,savings}
cmk37a6zo01wyu2l7duvoq63m	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (4, 1) and (8, 9).	y = 2x - 7	LINEAR_GRAPHING	HARD	{two-points,find-equation}
cmk37a6zo01wzu2l7xypa7bts	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (0, 10) with gradient -3.	y = -3x + 10	LINEAR_GRAPHING	HARD	{point-slope,y-intercept-given,negative-slope}
cmk37a6zo01x0u2l7qxhc45gk	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of a line parallel to y = -x + 5?	-1	LINEAR_GRAPHING	HARD	{parallel-lines,negative-slope}
cmk37a6zo01x2u2l78zpr2ys0	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (-3, 1) and (1, 9).	y = 2x + 7	LINEAR_GRAPHING	HARD	{two-points,find-equation,negative-coordinates}
cmk37a6zo01x3u2l7xhpn2d8t	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (7, 20) with gradient 3.	y = 3x - 1	LINEAR_GRAPHING	HARD	{point-slope}
cmk37a6zo01x4u2l7xmre86u5	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of a line parallel to y = 10x - 7?	10	LINEAR_GRAPHING	HARD	{parallel-lines}
cmk37a6zo01x5u2l71go2wctr	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A water cooler holds 15L and is filled at 0.5L/min. Write an equation for volume V after t minutes.	V = 15 + 0.5t	LINEAR_GRAPHING	HARD	{real-world,filling}
cmk37a6zo01x6u2l7jvaiobe7	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (0, 7) and (5, 22).	y = 3x + 7	LINEAR_GRAPHING	HARD	{two-points,find-equation}
cmk37a6zo01x7u2l7hqsrpw8u	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (3, 5) with gradient -2.	y = -2x + 11	LINEAR_GRAPHING	HARD	{point-slope,negative-slope}
cmk37a6zo01x8u2l7cmgso3z3	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A train travels 250km in 2 hours at constant speed. What is its speed in km/h?	125	LINEAR_GRAPHING	HARD	{real-world,rate,calculation}
cmk37a6zo01x9u2l75el4hso7	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (2, 7) and (6, 15).	y = 2x + 3	LINEAR_GRAPHING	HARD	{two-points,find-equation}
cmk37a6zo01xau2l7ajbj0vke	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of a line parallel to y = -4x + 9?	-4	LINEAR_GRAPHING	HARD	{parallel-lines,negative-slope}
cmk37a6zo01xbu2l7opryw463	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A streaming service costs $12 per month. Write an equation for total cost C after m months.	C = 12m	LINEAR_GRAPHING	HARD	{real-world,linear-cost}
cmk37a6zo01xcu2l7q18cs22a	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the equation of the line through (-4, 5) and (2, 17).	y = 2x + 13	LINEAR_GRAPHING	HARD	{two-points,find-equation,negative-coordinates}
cmk37a6zo01xdu2l750or14pu	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of y = 11x + 5?	11	LINEAR_GRAPHING	EASY	{gradient,slope-intercept-form}
cmk37a6zo01xeu2l73yu9r3nj	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the y-intercept of y = 12x - 9?	-9	LINEAR_GRAPHING	EASY	{y-intercept,slope-intercept-form}
cmk37a6zo01xfu2l7v4u82wom	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (10, 5) and (12, 11).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zo01xgu2l7pnc7j761	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 12 and y-intercept 4.	y = 12x + 4	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zo01xhu2l7uui8z3ku	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 8x - 40.	5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zo01xiu2l77hbg8w8u	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (6, 10) and (9, 19).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zo01xju2l7qxz8dvrq	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -10 and y-intercept 20.	y = -10x + 20	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a6zo01xku2l7ys8w61f0	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 9x + 45.	-5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zo01xlu2l7qwx5x8fz	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (8, 3) and (11, 12).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zo01xmu2l7hkq2bo6m	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 11 and y-intercept -8.	y = 11x - 8	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zo01xnu2l7aw9cr7e9	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = -11x - 33.	-3	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation,negative}
cmk37a6zo01xou2l78jod2zzb	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (0, 9) and (6, 27).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zo01xpu2l7vq2mo9zz	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 13 and y-intercept 2.	y = 13x + 2	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zo01xqu2l76nwdrfdy	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 12x - 48.	4	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zo01xru2l7j7tk6gcg	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (4, 8) and (10, 26).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zo01xsu2l7woyeuz86	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -11 and y-intercept 22.	y = -11x + 22	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a6zo01xtu2l7z6wwze3p	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 10x + 50.	-5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zo01xuu2l7rn5kpoy2	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (9, 7) and (12, 16).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zo01xvu2l7we1elbw5	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 14 and y-intercept -3.	y = 14x - 3	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zo01xwu2l7w1c3nq0c	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = -12x + 60.	5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zo01xxu2l7uto6fika	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (7, 11) and (10, 20).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zo01xyu2l7d3li2iaa	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 15 and y-intercept 1.	y = 15x + 1	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept}
cmk37a6zy01y6u2l7oskponea	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/4 + 1 1/8	2 3/8	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01y7u2l7wdjziaz4	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/2 + 1 1/6	3 2/3	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01y9u2l7o6jhdxft	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/3 + 1 1/9	3 4/9	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01ybu2l7vyj02uw0	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/2 + 1 1/8	3 5/8	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01ycu2l7c9hwyomy	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/4 + 2 1/12	3 1/3	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01yeu2l7odd16okw	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/2 + 2 1/10	3 3/5	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01yfu2l7zgnoij9m	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/3 + 1 1/12	3 5/12	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01yhu2l7uk7lyw4k	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 2/6 + 1 1/12	3 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01yiu2l7gm83lm7q	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 3/10 + 1 1/5	2 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01yku2l7yjsqg5sv	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/6 + 2 1/3	3 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01ylu2l7r302cx7q	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/12 + 1 1/6	3 1/4	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01ynu2l72wla3uwx	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/9 + 1 2/3	3 7/9	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01ypu2l7figqri19	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/4 + 1 1/2	3 3/4	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01yqu2l72t32ub0t	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/3 + 1 2/9	2 5/9	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01ysu2l759abeomz	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/10 + 1 3/5	2 7/10	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01ytu2l741xntl0v	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/12 + 1 1/4	3 1/3	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01yvu2l76cyqqgsw	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/15 + 1 2/5	3 2/5	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01ywu2l7trp7dr7c	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/6 + 1 1/2	2 2/3	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01yyu2l7otxm91ss	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/4 + 1 3/8	2 5/8	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01z0u2l7pky4oyfi	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/3 + 1 1/6	2 5/6	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01z1u2l75b3n6t80	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/5 + 1 2/10	3 2/5	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01z3u2l7s9d05xcq	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 2/9 + 1 1/3	3 5/9	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01z4u2l7x54lpry9	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/12 + 1 1/6	2 1/4	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01z6u2l7n743x7xs	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/8 + 1 1/4	2 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01z7u2l7pgjxnzwn	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/6 + 1 2/3	3 5/6	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01z9u2l7jbv4rb8e	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 2/3 + 1 1/9	3 7/9	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zbu2l7euv1djc1	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/4 + 1 2/8	3 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zcu2l7prksn03q	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/3 + 1 3/6	2 5/6	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zeu2l7t8j2tu3p	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/12 + 1 1/6	2 1/3	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01zgu2l7mgxt8nhu	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/9 + 1 1/3	2 4/9	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zhu2l7tbleytez	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/15 + 1 1/5	3 1/3	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01zju2l742nsknln	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/10 + 1 2/5	3 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01zku2l7ewnsu2q1	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/4 + 1 2/12	2 5/12	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zo01xzu2l71pebhq0r	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 11x + 55.	-5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zo01y0u2l71qfklwqq	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (5, 9) and (8, 18).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zo01y2u2l77vttkiam	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the x-intercept of y = 13x - 65.	5	LINEAR_GRAPHING	MEDIUM	{x-intercept,solve-equation}
cmk37a6zo01y3u2l7ijmc3ovu	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (11, 6) and (14, 15).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zy0205u2l7xxp5rbpa	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 2/9 + 1 1/4	3 17/36	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0207u2l7xsd9s74c	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/7 + 1 2/3	3 17/21	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0209u2l7k662tu62	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/8 + 1 1/5	3 13/40	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020au2l7kk95i54b	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/6 + 1 2/9	2 7/18	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020cu2l7nbew00ew	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/5 + 1 3/7	2 22/35	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020eu2l7s936unzn	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/8 + 1 2/9	2 25/72	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020gu2l7f91vxutm	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/7 + 1 2/5	2 24/35	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020hu2l7j4qdk4g8	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/9 + 1 1/5	3 14/45	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020ju2l7aqeraudu	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 3/5 + 1 1/4	3 17/20	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020lu2l7nfutr32e	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 2/9 + 1 2/5	3 28/45	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020mu2l71ruip5j2	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/4 + 1 3/10	2 11/20	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy020ou2l78p9b19n3	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/3 + 1 2/7	2 20/21	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020qu2l7cgaqddsi	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/8 + 1 1/3	2 11/24	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020ru2l7olpr5be1	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 3/7 + 1 1/5	3 22/35	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020tu2l7xena5rb3	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 2/5 + 1 2/9	3 28/45	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020vu2l7u2dnty6p	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/4 + 1 2/9	3 17/36	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020xu2l7qyojg3f0	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/7 + 1 1/4	3 11/28	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020yu2l71h21oux6	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/3 + 1 2/5	2 11/15	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0210u2l726etn4ul	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/9 + 1 1/6	2 7/18	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0211u2l7wpgoy0xi	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/10 + 1 1/4	3 7/20	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy0213u2l7tymojrf2	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/6 + 1 3/7	3 25/42	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0215u2l7qg0ub335	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/8 + 1 2/5	3 21/40	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0217u2l78jnv2yja	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 2/3 + 1 2/5	4 1/15	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0218u2l788syn4ly	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/4 + 1 1/5	2 9/20	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy021au2l710luoklg	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/6 + 1 1/5	2 11/30	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy021cu2l7zqrvlbt4	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/9 + 1 2/5	2 23/45	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy021du2l7njntgb38	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/3 + 1 1/8	3 11/24	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021fu2l7bdzl8mkl	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/3 - 1 1/6	2 1/6	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021hu2l79ai33g3c	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/3 - 1 1/6	2 1/2	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021iu2l7sj7akk6b	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 3/5 - 1 1/10	1 1/2	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705021ku2l7igczkq30	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 2/3 - 1 1/6	1 1/2	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021mu2l7je8zzi1k	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 4/5 - 1 1/10	1 7/10	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705021nu2l7fi5zpebt	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/2 - 1 1/6	2 1/3	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021pu2l7rc23tp3l	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/5 - 1 1/10	2 3/10	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705021qu2l7wthpogi4	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 3/4 - 1 1/8	1 5/8	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021su2l7aqbz86k5	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 2/5 - 1 1/10	1 3/10	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705021uu2l7zod5ze84	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 1/2 - 1 1/6	1 1/3	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021wu2l7j99b7b7o	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 3/5 - 1 1/15	1 8/15	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705021xu2l7qz7q62ix	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/4 - 1 1/12	2 1/6	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705021zu2l77o2po9eu	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 3/4 - 2 1/12	1 2/3	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7050220u2l7hq54ik4z	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 2/3 - 1 1/12	1 7/12	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7050222u2l72ludeuzm	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 4/5 - 1 1/15	1 11/15	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7050223u2l70h3fvup3	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/3 - 2 1/9	1 2/9	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7050225u2l70m1ppqgo	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/2 - 2 1/6	1 1/3	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7050226u2l7wturqcwo	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 3/4 - 1 1/12	1 2/3	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7050228u2l7xg026a2w	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 1/2 - 1 1/8	1 3/8	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7050229u2l7p4zkche6	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/3 - 1 1/12	2 1/4	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022bu2l760achaq6	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 3/4 - 2 1/4	1 1/2	FRACTION_SUBTRACTION	MEDIUM	{mixed-numbers,single-digit-denominators}
cmk37a705022du2l7hr8rfdmg	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/2 - 1 3/8	2 1/8	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705022eu2l7jrxbt8h1	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 4/5 - 1 3/10	1 1/2	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022gu2l7l1f92twl	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 1/2 - 1 1/12	1 5/12	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022hu2l72xndn8a8	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/3 - 2 1/6	1 1/2	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705022ju2l7zb9kw3na	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/3 - 1 1/15	2 1/5	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022ku2l7i7ngpg63	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 5/6 - 1 1/6	1 2/3	FRACTION_SUBTRACTION	MEDIUM	{mixed-numbers,single-digit-denominators}
cmk37a705022mu2l7xvfr7vrd	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 2/5 - 1 1/15	1 1/3	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022nu2l7id0oa7w1	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 3/4 - 1 1/4	2 1/2	FRACTION_SUBTRACTION	MEDIUM	{mixed-numbers,single-digit-denominators}
cmk37a705022pu2l7d5xie1k8	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 4/5 - 2 1/10	1 7/10	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022qu2l7vk1v6bu0	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 7/8 - 1 1/8	1 3/4	FRACTION_SUBTRACTION	MEDIUM	{mixed-numbers,single-digit-denominators}
cmk37a705022ru2l7eov6clmt	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/2 - 1 1/12	2 5/12	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022tu2l71k3p4gkt	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/3 - 2 1/12	1 7/12	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022uu2l71pwzrb8g	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 3/5 - 1 2/10	1 2/5	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022wu2l7okek0irw	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 7/10 - 1 1/10	1 3/5	FRACTION_SUBTRACTION	MEDIUM	{mixed-numbers}
cmk37a705022xu2l71ahn25a4	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/2 - 2 1/12	1 5/12	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022zu2l76fvc6grq	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 5/6 - 1 1/6	2 2/3	FRACTION_SUBTRACTION	MEDIUM	{mixed-numbers,single-digit-denominators}
cmk37a7050230u2l767wr0k8d	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 3/4 - 1 1/4	1 1/2	FRACTION_SUBTRACTION	MEDIUM	{mixed-numbers,single-digit-denominators}
cmk37a7050232u2l7vmqxzzqp	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 1/2 - 1 3/10	1 1/5	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7050233u2l7l2312zlv	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/3 - 1 1/6	2 1/2	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7050235u2l74zoz4klt	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/3 - 2 1/12	1 1/4	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7050236u2l7sbodxmwg	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 4/5 - 1 2/10	1 3/5	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7050238u2l7tb40uw4m	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 7/12 - 1 1/12	1 1/2	FRACTION_SUBTRACTION	MEDIUM	{mixed-numbers}
cmk37a7050239u2l7i92lv5j3	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/2 - 1 1/15	2 7/30	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706023bu2l791ovb6di	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 5/6 - 2 1/3	1 1/2	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023cu2l7gftbkukq	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 3/5 - 1 1/10	1 1/2	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706023eu2l7x6x5dedh	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 9/10 - 1 2/10	1 7/10	FRACTION_SUBTRACTION	MEDIUM	{mixed-numbers}
cmk37a706023fu2l7n6od4uoi	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/5 - 1 3/15	2 1/5	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706023gu2l7zwhz61du	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 5/6 - 1 2/12	1 2/3	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706023ju2l72pbwtfj8	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 7/8 - 1 3/8	2 1/2	FRACTION_SUBTRACTION	MEDIUM	{mixed-numbers,single-digit-denominators}
cmk37a706023lu2l7js13kpmz	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/3 - 1 1/4	2 1/12	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023mu2l7a7kg6m9b	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 2/5 - 2 1/3	2 1/15	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023ou2l70k1r4p58	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 1/2 - 2 2/7	3 3/14	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023qu2l70tvf5g2v	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 3/5 - 2 1/4	1 7/20	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023su2l71ej8qumm	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 2/7 - 2 1/3	2 13/21	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023tu2l7yt5ipk59	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 5/6 - 1 3/7	2 13/42	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023vu2l7whp7z6gh	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/5 - 1 1/6	2 7/30	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023xu2l7iir521sd	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 4/5 - 1 2/3	3 2/15	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023zu2l7hkpbjf8b	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 5/6 - 2 3/8	2 11/24	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060240u2l7zmqjvhjg	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 2/3 - 1 4/7	3 14/21	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060242u2l7v7awebhj	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 1/4 - 2 1/6	2 1/12	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060244u2l7ic2yjuit	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/3 - 2 1/4	1 5/12	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060245u2l7n85nk6kv	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 5/8 - 1 3/10	3 13/40	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7060247u2l79s08somd	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 4/5 - 1 1/3	2 7/15	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060249u2l78zqgpivj	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 5/6 - 1 2/9	4 11/18	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024au2l7fwv6rr6i	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/3 - 2 1/5	1 2/15	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024cu2l7yalou7xe	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 2/5 - 2 1/6	3 7/30	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024eu2l7b2tyyidm	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 1/6 - 2 3/10	1 13/15	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706024fu2l76kyi3474	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 3/4 - 1 5/9	4 7/36	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024hu2l7q1fcw3ff	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 4/5 - 1 1/6	3 19/30	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024ju2l7u67hbebh	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 5/6 - 1 1/4	2 7/12	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024ku2l7mkvvcesj	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 2/9 - 2 3/7	1 41/63	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024mu2l7fhrti4wr	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/4 - 2 2/9	1 5/36	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024ou2l7am5m9ynl	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 2/3 - 2 3/10	3 1/30	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706024pu2l783l86161	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 3/8 - 1 2/5	1 39/40	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024ru2l7mp27jrzm	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 4/6 - 1 5/9	4 1/18	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024tu2l7za9s27qf	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 3/7 - 1 2/9	3 13/63	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024uu2l7ih136i3q	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 1/4 - 2 3/10	2 19/20	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706024wu2l7ovpl5blr	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 2/3 - 2 2/7	2 8/21	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024yu2l7odzytuc7	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/6 - 2 3/10	13/15	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706024zu2l7rq65ie5x	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 4/7 - 1 2/5	3 6/35	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060251u2l7y0ot723a	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/9 - 1 1/4	1 35/36	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060253u2l7do34c1e1	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 4/5 - 1 2/6	4 7/15	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060254u2l7e8q8rjta	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 3/10 - 2 1/7	1 11/70	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7060256u2l73arzp1ol	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 1/7 - 2 2/5	2 19/35	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060259u2l7oxlnnc56	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 3/7 - 1 1/4	4 5/28	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025bu2l7ggtj3qwn	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 5/9 - 1 3/7	3 8/63	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025du2l7zsxk8qo7	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 3/7 - 1 2/8	2 5/56	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025eu2l7923qlwd7	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 1/9 - 2 1/6	1 17/18	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025gu2l76payoj40	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 5/8 - 2 1/5	1 17/40	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025iu2l7t4njlf8h	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 1/5 - 2 3/8	2 33/40	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025ju2l7bqirmn64	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 3/4 - 1 1/6	2 7/12	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025lu2l7iyzu9rk4	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 5/10 - 1 1/4	4 1/4	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706025nu2l7128txxwt	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 3/8 - 1 1/7	3 13/56	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025ou2l7vwx2cdmb	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 2/9 - 2 2/6	2 8/9	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025qu2l7uset86xt	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 2/7 - 2 3/11	2 43/77	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706025ru2l71beg9h7i	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	6 3/9 - 1 5/13	4 58/117	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706025tu2l7uzzkruwb	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	7 1/13 - 3 4/9	3 40/117	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706025uu2l743m5ca2y	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 4/12 - 1 3/11	4 11/132	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706025wu2l77bbdsz1a	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 7/11 - 1 2/13	3 69/143	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706025xu2l7xqnwun3a	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	7 3/10 - 2 4/11	4 89/110	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706025yu2l723zmno3q	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 5/13 - 1 1/9	4 32/117	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7060260u2l7baa2d698	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 6/15 - 1 2/13	3 32/195	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7060261u2l7kasq3hzt	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	7 2/9 - 3 5/11	3 67/99	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7060263u2l7cjxlfps7	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	6 4/11 - 2 1/7	4 13/77	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7060264u2l7jf571q34	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 5/12 - 1 3/13	3 29/156	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7060265u2l7yv3fuiq8	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	7 1/15 - 2 2/11	4 116/165	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7060267u2l711yyqar0	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	6 2/10 - 2 4/13	3 41/65	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7060268u2l7c4dub04i	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 3/11 - 1 1/15	3 34/165	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026au2l74i1rx8cf	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 1/12 - 1 6/11	3 49/132	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026bu2l7oobu341h	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	6 6/13 - 2 3/10	4 21/130	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026du2l7vj932qdk	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	7 4/11 - 2 5/13	4 97/143	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026eu2l73q8s8tkd	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 5/9 - 1 2/12	4 7/36	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026fu2l7nb4f1uxw	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	6 3/13 - 2 1/15	4 32/195	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026hu2l7m6co5dqq	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	7 1/12 - 3 4/13	3 101/156	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026iu2l7uppzcjbl	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 2/11 - 1 5/15	3 41/165	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026ju2l7ico5jxvw	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	6 5/15 - 2 2/9	4 1/45	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026lu2l7fygege4c	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	7 3/11 - 2 6/12	4 7/132	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026mu2l7vs2jza6a	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 6/9 - 1 3/13	4 41/117	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026ou2l74oueybqm	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 5/13 - 1 2/11	3 29/143	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026pu2l7ptuiqhiu	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	7 2/15 - 3 1/12	4 3/60	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026ru2l7w8a76k5h	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	6 3/12 - 2 2/10	4 1/60	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026su2l79c3gzn7b	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 7/9 - 1 4/15	3 41/45	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a70p027xu2l7z5z7ztpc	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 23/25 to a percentage	92%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a6x000w2u2l7rfb74d5y	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2 ÷ 5	0.4	DECIMALS_DIVISION	MEDIUM	{whole-div-whole-decimal-result}
cmk37a70p026vu2l7tkukbzfh	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 1/4 to a percentage	25%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,common-fractions}
cmk37a70p026wu2l7e7o64luy	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 3/4 to a percentage	75%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,common-fractions}
cmk37a70p026xu2l7vlokmxzz	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 1/5 to a percentage	20%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,common-fractions}
cmk37a70p026yu2l7swgdczdr	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 2/5 to a percentage	40%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,common-fractions}
cmk37a70p026zu2l7wel9992y	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 3/5 to a percentage	60%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,common-fractions}
cmk37a70p0270u2l79gnels7f	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 4/5 to a percentage	80%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,common-fractions}
cmk37a70p0271u2l7dj577ccx	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 1/10 to a percentage	10%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,common-fractions}
cmk37a70p0272u2l7fk4gx6gs	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 3/10 to a percentage	30%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,common-fractions}
cmk37a70p0273u2l7x2kx586k	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 7/10 to a percentage	70%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,common-fractions}
cmk37a70p0274u2l7x5doahid	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 9/10 to a percentage	90%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,common-fractions}
cmk37a70p0275u2l76t9vjuer	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 1/100 to a percentage	1%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,hundredths}
cmk37a70p0276u2l783ld30fj	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 5/100 to a percentage	5%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,hundredths}
cmk37a70p0277u2l7jqb03aov	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 25/100 to a percentage	25%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,hundredths}
cmk37a70p0278u2l77ykgyxv7	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 50/100 to a percentage	50%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,hundredths}
cmk37a70p0279u2l710iseip3	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 75/100 to a percentage	75%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,hundredths}
cmk37a70p027au2l7g61nem28	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 1/3 to a percentage (round to 1 decimal place)	33.3%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,rounding}
cmk37a70p027bu2l728sp9qh3	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 2/3 to a percentage (round to 1 decimal place)	66.7%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,rounding}
cmk37a70p027cu2l7fj7ou05b	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 1/8 to a percentage	12.5%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,eighths}
cmk37a70p027du2l7ehtuzq83	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 3/8 to a percentage	37.5%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,eighths}
cmk37a70p027eu2l7hqd8lze2	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 5/8 to a percentage	62.5%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,eighths}
cmk37a70p027fu2l7v8s1o8tm	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 7/8 to a percentage	87.5%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,eighths}
cmk37a70p027gu2l71thqhrf0	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 1/20 to a percentage	5%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027hu2l7dio71umn	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 3/20 to a percentage	15%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027iu2l7ylsr7kq5	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 7/20 to a percentage	35%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027ju2l7pna6eei1	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 9/20 to a percentage	45%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027ku2l7lbw80zn7	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 11/20 to a percentage	55%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027lu2l70qg17p9e	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 13/20 to a percentage	65%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027mu2l7gh0mcpoo	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 17/20 to a percentage	85%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027nu2l78fflgei6	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 19/20 to a percentage	95%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027ou2l72wct96jb	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 1/25 to a percentage	4%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027pu2l7b1e8g51k	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 3/25 to a percentage	12%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027qu2l7gy69p9dt	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 7/25 to a percentage	28%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027ru2l7cr53245o	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 9/25 to a percentage	36%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027su2l7n8nx8ghz	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 11/25 to a percentage	44%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027tu2l7zkqxguai	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 13/25 to a percentage	52%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027uu2l7z50pry1a	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 17/25 to a percentage	68%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027vu2l7kaq83fs6	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 19/25 to a percentage	76%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027wu2l7xyuvf83z	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 21/25 to a percentage	84%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027yu2l7ily28l5j	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 1/50 to a percentage	2%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p027zu2l75sohy70j	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 3/50 to a percentage	6%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p0280u2l7rbd1o2iv	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 7/50 to a percentage	14%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p0281u2l7vr5cc84x	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 9/50 to a percentage	18%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p0282u2l70rtx3gpp	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 13/50 to a percentage	26%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p0283u2l76rl0evtl	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 17/50 to a percentage	34%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p0284u2l74q21aay7	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 21/50 to a percentage	42%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p0285u2l7tbvwc3qg	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 27/50 to a percentage	54%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p0286u2l705ezsceh	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 31/50 to a percentage	62%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p0287u2l7g2kwynd9	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 37/50 to a percentage	74%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage}
cmk37a70p0288u2l7ca8okf98	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.5 to a percentage	50%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,common-decimals}
cmk37a70p0289u2l7bsdj2k93	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.25 to a percentage	25%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,common-decimals}
cmk37a70p028au2l7zt431w9k	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.75 to a percentage	75%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,common-decimals}
cmk37a70p028bu2l7d8wuteng	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.1 to a percentage	10%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,tenths}
cmk37a70p028cu2l7yxmughke	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.2 to a percentage	20%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,tenths}
cmk37a70p028du2l7xq6e4wvy	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.3 to a percentage	30%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,tenths}
cmk37a70p028eu2l77ytrs9mq	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.4 to a percentage	40%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,tenths}
cmk37a70p028fu2l73nogvczm	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.6 to a percentage	60%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,tenths}
cmk37a70p028gu2l7ezop8xsn	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.7 to a percentage	70%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,tenths}
cmk37a70p028hu2l7r1vhp2bb	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.8 to a percentage	80%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,tenths}
cmk37a70p028iu2l73ulonsss	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.9 to a percentage	90%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,tenths}
cmk37a70p028ju2l7lon9pmlu	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.01 to a percentage	1%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028ku2l7afyefx0b	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.05 to a percentage	5%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028lu2l76307navb	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.15 to a percentage	15%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028mu2l7qcis7pll	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.35 to a percentage	35%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028nu2l7sm5ksh3m	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.45 to a percentage	45%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028ou2l7uq06eq4t	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.55 to a percentage	55%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028pu2l7u8a0ynxa	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.65 to a percentage	65%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028qu2l78v1xrmv4	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.85 to a percentage	85%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028ru2l7kt9kdiy8	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.95 to a percentage	95%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028su2l72nktcs8f	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.12 to a percentage	12%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028tu2l7j4c1gy6r	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.28 to a percentage	28%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028uu2l7wfqnyul5	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.36 to a percentage	36%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028vu2l7zq82osfu	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.44 to a percentage	44%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028wu2l7h9v8f62q	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 0.52 to a percentage	52%	PERCENTAGE_CONVERSION	EASY	{decimal-to-percentage,hundredths}
cmk37a70p028xu2l7026de2kf	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 50% to a decimal	0.5	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal,common-percentages}
cmk37a70p028yu2l74mpl43qr	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 25% to a decimal	0.25	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal,common-percentages}
cmk37a70p028zu2l706yaqty5	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 75% to a decimal	0.75	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal,common-percentages}
cmk37a70p0290u2l7iloem8xx	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 10% to a decimal	0.1	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70p0292u2l7ddst12wd	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 30% to a decimal	0.3	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70p0293u2l72no7rhfv	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 40% to a decimal	0.4	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q0294u2l7xm9ri4a9	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 60% to a decimal	0.6	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q0295u2l7vqypepnf	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 70% to a decimal	0.7	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q0296u2l72aeaot3r	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 80% to a decimal	0.8	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q0297u2l7dgsiwcr3	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 90% to a decimal	0.9	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q0298u2l7mupqo007	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 1% to a decimal	0.01	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q0299u2l70yp9k8yq	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 5% to a decimal	0.05	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029au2l7sbcyfono	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 15% to a decimal	0.15	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029bu2l7udj70l10	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 35% to a decimal	0.35	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029cu2l7zaqguxla	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 45% to a decimal	0.45	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029du2l78te6a4zi	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 55% to a decimal	0.55	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029eu2l72i4uefz1	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 65% to a decimal	0.65	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029fu2l72d4cebli	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 85% to a decimal	0.85	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029gu2l7ynhm4i96	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 95% to a decimal	0.95	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029hu2l76rapori4	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 12% to a decimal	0.12	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029iu2l7l6we794v	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 28% to a decimal	0.28	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029ju2l77taid3vr	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 36% to a decimal	0.36	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029ku2l7wzqyjahj	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 44% to a decimal	0.44	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029lu2l7ey0xhsb2	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 52% to a decimal	0.52	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q029mu2l7iyb315cy	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 50% to a fraction in simplest form	1/2	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,common-percentages}
cmk37a70q029nu2l73l7khjza	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 25% to a fraction in simplest form	1/4	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,common-percentages}
cmk37a70q029ou2l7ujoc651b	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 75% to a fraction in simplest form	3/4	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,common-percentages}
cmk37a70q029pu2l7lvvgdbv6	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 20% to a fraction in simplest form	1/5	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fifths}
cmk37a70q029qu2l7my676ou9	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 40% to a fraction in simplest form	2/5	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fifths}
cmk37a70q029ru2l7ud2hhlln	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 60% to a fraction in simplest form	3/5	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fifths}
cmk37a70q029su2l7hylt876w	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 80% to a fraction in simplest form	4/5	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fifths}
cmk37a70q029tu2l7zfzgfk2v	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 10% to a fraction in simplest form	1/10	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,tenths}
cmk37a70q029uu2l73f42oapd	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 30% to a fraction in simplest form	3/10	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,tenths}
cmk37a70q029vu2l7nq5z92gd	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 70% to a fraction in simplest form	7/10	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,tenths}
cmk37a70q029wu2l70jjxt1ya	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 90% to a fraction in simplest form	9/10	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,tenths}
cmk37a70q029xu2l7zlbraijv	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 5% to a fraction in simplest form	1/20	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twentieths}
cmk37a70q029yu2l7fbuu6nvn	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 15% to a fraction in simplest form	3/20	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twentieths}
cmk37a70q029zu2l7712jnjf7	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 35% to a fraction in simplest form	7/20	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twentieths}
cmk37a70q02a0u2l7e4y9ri7y	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 45% to a fraction in simplest form	9/20	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twentieths}
cmk37a70q02a1u2l7vnm5m4o1	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 55% to a fraction in simplest form	11/20	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twentieths}
cmk37a70q02a2u2l7oh13ktul	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 65% to a fraction in simplest form	13/20	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twentieths}
cmk37a70q02a3u2l7ra2vplra	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 85% to a fraction in simplest form	17/20	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twentieths}
cmk37a70q02b4u2l7svoao49i	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 25% of 100	25	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,quarters}
cmk37a70q02a5u2l7neem1uio	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 4% to a fraction in simplest form	1/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02a6u2l7ptf3ir2j	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 12% to a fraction in simplest form	3/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02a7u2l7rele1v7u	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 16% to a fraction in simplest form	4/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02a8u2l7rkfbbil7	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 28% to a fraction in simplest form	7/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02a9u2l7w5tidi64	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 36% to a fraction in simplest form	9/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02aau2l78m4ma5ve	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 44% to a fraction in simplest form	11/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02abu2l79pfcjykz	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 52% to a fraction in simplest form	13/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02acu2l7w1o5jfsv	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 64% to a fraction in simplest form	16/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02adu2l7x7rwrl7g	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 68% to a fraction in simplest form	17/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02aeu2l7foguctqq	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 76% to a fraction in simplest form	19/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02afu2l7nyrwlvgf	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 84% to a fraction in simplest form	21/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02agu2l7pxk33gxt	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 92% to a fraction in simplest form	23/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02ahu2l7zuq3bp6v	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 96% to a fraction in simplest form	24/25	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twenty-fifths}
cmk37a70q02aiu2l7ulyaupjg	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 2% to a fraction in simplest form	1/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02aju2l7xsdwigrs	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 6% to a fraction in simplest form	3/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02aku2l7cadiqe4h	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 14% to a fraction in simplest form	7/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02alu2l7a8xy24qb	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 18% to a fraction in simplest form	9/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02amu2l7k2pgqyyb	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 22% to a fraction in simplest form	11/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02anu2l748r7otyr	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 26% to a fraction in simplest form	13/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02aou2l7q806swls	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 34% to a fraction in simplest form	17/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02apu2l7gv4odiyw	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 38% to a fraction in simplest form	19/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02aqu2l778bkywo4	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 42% to a fraction in simplest form	21/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02aru2l7ksc0wlrd	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 46% to a fraction in simplest form	23/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02asu2l7vy4pzqt8	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 54% to a fraction in simplest form	27/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02atu2l75oa1yr9x	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 58% to a fraction in simplest form	29/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02auu2l710ng1jqv	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 62% to a fraction in simplest form	31/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02avu2l76px43s6g	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 66% to a fraction in simplest form	33/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02awu2l74p8v9t1p	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 74% to a fraction in simplest form	37/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02axu2l71p4yq0th	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 78% to a fraction in simplest form	39/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02ayu2l77kwki35i	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 82% to a fraction in simplest form	41/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02azu2l72xsk7g0d	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 86% to a fraction in simplest form	43/50	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,fiftieths}
cmk37a70q02b0u2l7b41wi7nd	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 50% of 100	50	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,halves}
cmk37a70q02b1u2l7wwab647q	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 50% of 80	40	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,halves}
cmk37a70q02b2u2l71a6nv72o	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 50% of 60	30	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,halves}
cmk37a70q02b3u2l7j13twb3b	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 50% of 120	60	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,halves}
cmk37a70q02b6u2l7goa4x3eh	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 25% of 60	15	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,quarters}
cmk37a70q02b7u2l77rhsowou	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 25% of 120	30	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,quarters}
cmk37a70q02b8u2l7xsqz9oye	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 75% of 100	75	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,three-quarters}
cmk37a70q02b9u2l78l3lnv8y	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 75% of 80	60	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,three-quarters}
cmk37a70q02bau2l7r0w1sqdj	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 75% of 60	45	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,three-quarters}
cmk37a70q02bbu2l7iyxcy5sp	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 75% of 40	30	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,three-quarters}
cmk37a70q02bcu2l7xbl8gv61	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 10% of 100	10	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,tenths}
cmk37a70q02bdu2l7wtjs6y54	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 10% of 150	15	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,tenths}
cmk37a70q02beu2l72khl8uc5	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 10% of 200	20	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,tenths}
cmk37a70q02bfu2l7j0nnu91t	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 10% of 250	25	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,tenths}
cmk37a70q02bgu2l7hkzmdx5o	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 20% of 100	20	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,fifths}
cmk37a70q02bhu2l7yvio6f09	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 20% of 150	30	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,fifths}
cmk37a70q02biu2l7krkqcntc	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 20% of 60	12	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,fifths}
cmk37a70q02bju2l7h8n41s0w	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 20% of 80	16	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,fifths}
cmk37a70q02bku2l7lqexpzfc	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 40% of 100	40	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,two-fifths}
cmk37a70q02blu2l7dsf33ht8	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 40% of 150	60	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,two-fifths}
cmk37a70q02bmu2l7c6jyn2et	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 40% of 50	20	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,two-fifths}
cmk37a70q02bnu2l7fft9mlyg	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 40% of 75	30	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,two-fifths}
cmk37a70q02bou2l7x5bi29v3	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 60% of 100	60	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,three-fifths}
cmk37a70q02bpu2l7wa6nmebp	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 60% of 50	30	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,three-fifths}
cmk37a70q02bqu2l7hrlc6ba9	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 60% of 150	90	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,three-fifths}
cmk37a70q02bru2l78fcp3c7h	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 60% of 200	120	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,three-fifths}
cmk37a70q02bsu2l7166f1rz3	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 80% of 100	80	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,four-fifths}
cmk37a70q02btu2l7whvkdqik	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 80% of 50	40	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,four-fifths}
cmk37a70q02buu2l7xgj60z9f	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 80% of 75	60	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,four-fifths}
cmk37a70q02bvu2l7wqjj7nr6	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 80% of 150	120	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,four-fifths}
cmk37a70q02bwu2l7fi2z2g9n	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 30% of 100	30	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02bxu2l7c0axgoq1	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 30% of 200	60	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02byu2l7hxwn6h1o	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 30% of 50	15	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02bzu2l7up7gywkn	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 70% of 100	70	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02c0u2l7yvtmhobg	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 70% of 200	140	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02c1u2l7u83bzfax	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 70% of 50	35	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02c2u2l7gvi8emt6	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 90% of 100	90	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02c3u2l7vy80czf7	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 90% of 200	180	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02c4u2l78mxc6jmv	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 90% of 50	45	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02c5u2l71vwobouq	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 5% of 100	5	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02c6u2l7y9dsg7mi	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 5% of 200	10	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02c7u2l70g7akw7a	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 5% of 300	15	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02c8u2l7f47lgpus	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 15% of 100	15	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02c9u2l76ts3hry2	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 15% of 200	30	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02cau2l70zue6z0a	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 35% of 100	35	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02cbu2l7ld8udq5f	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 35% of 200	70	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02cdu2l7vz30eu06	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 45% of 200	90	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70q02ceu2l7wx3ps6ec	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	What percentage is 20 out of 100?	20%	PERCENTAGE_CONVERSION	HARD	{find-percentage}
cmk37a70q02cfu2l7u16q1q6q	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	What percentage is 25 out of 100?	25%	PERCENTAGE_CONVERSION	HARD	{find-percentage}
cmk37a70q02cgu2l7qhdo2e9b	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	What percentage is 15 out of 50?	30%	PERCENTAGE_CONVERSION	HARD	{find-percentage}
cmk37a70q02chu2l7nsvem2mh	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	What percentage is 12 out of 60?	20%	PERCENTAGE_CONVERSION	HARD	{find-percentage}
cmk37a70q02ciu2l717grrqlv	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	What percentage is 18 out of 60?	30%	PERCENTAGE_CONVERSION	HARD	{find-percentage}
cmk37a70q02cju2l7jgoth8s8	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	What percentage is 24 out of 80?	30%	PERCENTAGE_CONVERSION	HARD	{find-percentage}
cmk37a70q02cku2l76yteehkg	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	What percentage is 30 out of 75?	40%	PERCENTAGE_CONVERSION	HARD	{find-percentage}
cmk37a70q02clu2l7vrqouibs	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	What percentage is 45 out of 150?	30%	PERCENTAGE_CONVERSION	HARD	{find-percentage}
cmk37a70q02cmu2l71vjg59we	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	What percentage is 36 out of 120?	30%	PERCENTAGE_CONVERSION	HARD	{find-percentage}
cmk37a70q02cnu2l7xlwurhgl	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	What percentage is 40 out of 200?	20%	PERCENTAGE_CONVERSION	HARD	{find-percentage}
cmk37a70q02cou2l7d6ntz1jv	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Increase 100 by 10%	110	PERCENTAGE_OF_QUANTITY	HARD	{percentage-increase}
cmk37a70q02cpu2l792bu46nd	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Increase 100 by 20%	120	PERCENTAGE_OF_QUANTITY	HARD	{percentage-increase}
cmk37a70q02cqu2l71d9r0gfg	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Increase 100 by 50%	150	PERCENTAGE_OF_QUANTITY	HARD	{percentage-increase}
cmk37a70q02cru2l7p5ui1f49	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Increase 200 by 10%	220	PERCENTAGE_OF_QUANTITY	HARD	{percentage-increase}
cmk37a70r02csu2l7rroxmoin	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Increase 200 by 25%	250	PERCENTAGE_OF_QUANTITY	HARD	{percentage-increase}
cmk37a70r02ctu2l7704fsoc2	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Increase 50 by 20%	60	PERCENTAGE_OF_QUANTITY	HARD	{percentage-increase}
cmk37a70r02cuu2l7jbgseeep	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Increase 50 by 40%	70	PERCENTAGE_OF_QUANTITY	HARD	{percentage-increase}
cmk37a70r02cvu2l7ojw814fd	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Increase 80 by 25%	100	PERCENTAGE_OF_QUANTITY	HARD	{percentage-increase}
cmk37a70r02cwu2l7blzc942j	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Increase 60 by 50%	90	PERCENTAGE_OF_QUANTITY	HARD	{percentage-increase}
cmk37a70r02cxu2l7nfm5g34i	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Increase 150 by 20%	180	PERCENTAGE_OF_QUANTITY	HARD	{percentage-increase}
cmk37a70r02cyu2l7x8us28t2	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Decrease 100 by 10%	90	PERCENTAGE_OF_QUANTITY	HARD	{percentage-decrease}
cmk37a70r02czu2l7bgcew3qj	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Decrease 100 by 20%	80	PERCENTAGE_OF_QUANTITY	HARD	{percentage-decrease}
cmk37a70r02d0u2l798bt1036	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Decrease 100 by 50%	50	PERCENTAGE_OF_QUANTITY	HARD	{percentage-decrease}
cmk37a70r02d1u2l77nhzokmz	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Decrease 200 by 10%	180	PERCENTAGE_OF_QUANTITY	HARD	{percentage-decrease}
cmk37a70r02d2u2l79akgd3lx	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Decrease 200 by 25%	150	PERCENTAGE_OF_QUANTITY	HARD	{percentage-decrease}
cmk37a70r02d3u2l7quem1ywr	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Decrease 50 by 20%	40	PERCENTAGE_OF_QUANTITY	HARD	{percentage-decrease}
cmk37a70r02d4u2l768fbeo44	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Decrease 50 by 40%	30	PERCENTAGE_OF_QUANTITY	HARD	{percentage-decrease}
cmk37a70r02d5u2l7mjt5na0k	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Decrease 80 by 25%	60	PERCENTAGE_OF_QUANTITY	HARD	{percentage-decrease}
cmk37a70r02d6u2l7rpsj86ry	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Decrease 60 by 50%	30	PERCENTAGE_OF_QUANTITY	HARD	{percentage-decrease}
cmk37a70r02d7u2l738eok5z4	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Decrease 150 by 20%	120	PERCENTAGE_OF_QUANTITY	HARD	{percentage-decrease}
cmk37a70r02d8u2l76pjehdu6	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	30 is 10% of what number?	300	PERCENTAGE_OF_QUANTITY	HARD	{reverse-percentage}
cmk37a70r02d9u2l7mcvyjubc	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	20 is 10% of what number?	200	PERCENTAGE_OF_QUANTITY	HARD	{reverse-percentage}
cmk37a70r02dau2l743zk319g	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	50 is 25% of what number?	200	PERCENTAGE_OF_QUANTITY	HARD	{reverse-percentage}
cmk37a70r02dbu2l7hq21ac2g	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	40 is 20% of what number?	200	PERCENTAGE_OF_QUANTITY	HARD	{reverse-percentage}
cmk37a70r02dcu2l7xsnut149	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	60 is 30% of what number?	200	PERCENTAGE_OF_QUANTITY	HARD	{reverse-percentage}
cmk37a70r02ddu2l71c4c51ix	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	75 is 50% of what number?	150	PERCENTAGE_OF_QUANTITY	HARD	{reverse-percentage}
cmk37a70r02deu2l7jgk1ilz1	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	45 is 30% of what number?	150	PERCENTAGE_OF_QUANTITY	HARD	{reverse-percentage}
cmk37a70r02dfu2l7l2jb08e4	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	35 is 70% of what number?	50	PERCENTAGE_OF_QUANTITY	HARD	{reverse-percentage}
cmk37a70r02dgu2l7xa0m9cos	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	24 is 40% of what number?	60	PERCENTAGE_OF_QUANTITY	HARD	{reverse-percentage}
cmk37a70r02dhu2l7zpsv98s4	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	18 is 20% of what number?	90	PERCENTAGE_OF_QUANTITY	HARD	{reverse-percentage}
cmk37a70r02diu2l73otc4zez	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	A shirt costs $80. It is on sale for 25% off. What is the sale price?	$60	PERCENTAGE_OF_QUANTITY	HARD	{word-problem,discount}
cmk37a71j02leu2l7ynj3i2bf	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 15:5.	3:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a70r02dku2l7dippetvz	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	A phone costs $200. The price increases by 10%. What is the new price?	$220	PERCENTAGE_OF_QUANTITY	HARD	{word-problem,price-increase}
cmk37a70r02dlu2l71hrw4rrn	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	A bike costs $150. The price increases by 20%. What is the new price?	$180	PERCENTAGE_OF_QUANTITY	HARD	{word-problem,price-increase}
cmk37a70r02dmu2l76dmjmt1f	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	A store has 200 items. 25% are sold. How many items are sold?	50	PERCENTAGE_OF_QUANTITY	HARD	{word-problem}
cmk37a70r02dnu2l7tkxeazwb	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	A class has 30 students. 40% are girls. How many girls are in the class?	12	PERCENTAGE_OF_QUANTITY	HARD	{word-problem}
cmk37a70r02dou2l7yfdzn5m8	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	A tank holds 150 litres. It is 60% full. How many litres are in the tank?	90	PERCENTAGE_OF_QUANTITY	HARD	{word-problem}
cmk37a70r02dpu2l74olw0sfz	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	A school has 400 students. 15% walk to school. How many students walk?	60	PERCENTAGE_OF_QUANTITY	HARD	{word-problem}
cmk37a70r02dqu2l7lvdaup0a	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	A car is worth $20,000. Its value decreases by 10%. What is its new value?	$18,000	PERCENTAGE_OF_QUANTITY	HARD	{word-problem,depreciation}
cmk37a70r02dru2l7plajtm7d	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	A laptop costs $1,000. The price decreases by 15%. What is the new price?	$850	PERCENTAGE_OF_QUANTITY	HARD	{word-problem,discount}
cmk37a71502dsu2l7jz5ykll5	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of flipping a coin and getting heads?	1/2	PROBABILITY	EASY	{coin,basic,fraction}
cmk37a71502dtu2l7zbzlpabp	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of flipping a coin and getting tails?	1/2	PROBABILITY	EASY	{coin,basic,fraction}
cmk37a71502duu2l74maw31jt	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 6 on a standard die?	1/6	PROBABILITY	EASY	{dice,basic,fraction}
cmk37a71502dvu2l7fbd70vth	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling an even number on a standard die?	1/2	PROBABILITY	EASY	{dice,even,fraction}
cmk37a71502dwu2l7m71gyz59	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling an odd number on a standard die?	1/2	PROBABILITY	EASY	{dice,odd,fraction}
cmk37a71502dxu2l7348aj3ym	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 3 red balls and 2 blue balls. What is the probability of picking a red ball?	3/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502dyu2l7dkj1l8jy	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 4 green balls and 1 yellow ball. What is the probability of picking a green ball?	4/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502dzu2l7qhihshca	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 4 equal sections: red, blue, green, yellow. What is the probability of landing on red?	1/4	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502e0u2l7bn65swh2	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 5 on a standard die?	2/3	PROBABILITY	EASY	{dice,inequality,fraction}
cmk37a71502e1u2l7yg39iafu	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number greater than 4 on a standard die?	1/3	PROBABILITY	EASY	{dice,inequality,fraction}
cmk37a71502e2u2l790v9xjcj	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 1 on a standard die?	1/6	PROBABILITY	EASY	{dice,basic,fraction}
cmk37a71502e3u2l7zkkwmzed	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 3 on a standard die?	1/6	PROBABILITY	EASY	{dice,basic,fraction}
cmk37a71502e4u2l7dzs8yymn	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 2 red balls and 3 blue balls. What is the probability of picking a blue ball?	3/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502e5u2l701ocvq8v	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 1 red ball and 4 blue balls. What is the probability of picking a red ball?	1/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502e6u2l7shy8lilt	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 8 equal sections, 2 of which are red. What is the probability of landing on red?	1/4	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502e7u2l7j0tjwqvx	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 3 on a standard die?	1/3	PROBABILITY	EASY	{dice,inequality,fraction}
cmk37a71502e8u2l77w3yym2h	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number greater than 2 on a standard die?	2/3	PROBABILITY	EASY	{dice,inequality,fraction}
cmk37a71502e9u2l7q7ywto62	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 5 red balls and 5 blue balls. What is the probability of picking a red ball?	1/2	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502eau2l71x6dy234	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 7 on a standard die?	0	PROBABILITY	EASY	{dice,impossible}
cmk37a71502ebu2l7g2zeg0aa	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number from 1 to 6 on a standard die?	1	PROBABILITY	EASY	{dice,certain}
cmk37a71502ecu2l7ef9eksn8	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 6 red balls and 4 blue balls. What is the probability of picking a red ball?	3/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502edu2l78hc89f77	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 3 red balls and 7 blue balls. What is the probability of picking a blue ball?	7/10	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502eeu2l7n5466a4v	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 6 equal sections: 3 red, 2 blue, 1 green. What is the probability of landing on blue?	1/3	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502efu2l7rc0osrts	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 2 or a 4 on a standard die?	1/3	PROBABILITY	EASY	{dice,or,fraction}
cmk37a71502eiu2l7vhkiibyv	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 4 on a standard die?	1/2	PROBABILITY	EASY	{dice,inequality,fraction}
cmk37a71502eju2l7b7s6n5wo	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number greater than 3 on a standard die?	1/2	PROBABILITY	EASY	{dice,inequality,fraction}
cmk37a71502eku2l7fyw0ztft	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 7 red balls and 3 blue balls. What is the probability of picking a blue ball?	3/10	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502elu2l7hdjim0wl	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 10 equal sections, 5 of which are red. What is the probability of landing on red?	1/2	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502emu2l777imlc8c	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 5 on a standard die?	1/6	PROBABILITY	EASY	{dice,basic,fraction}
cmk37a71502enu2l7zjdk9om9	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 7 on a standard die?	1	PROBABILITY	EASY	{dice,certain}
cmk37a71502eou2l7eol79v8y	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 8 red balls and 2 blue balls. What is the probability of picking a red ball?	4/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502epu2l7jgyh5ft4	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 1 red ball, 2 blue balls, and 3 green balls. What is the probability of picking a green ball?	1/2	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502equ2l7vxce3rtx	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 5 equal sections: 2 red, 2 blue, 1 green. What is the probability of landing on green?	1/5	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502eru2l7jadfzjye	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 4, 5, or 6 on a standard die?	1/2	PROBABILITY	EASY	{dice,or,fraction}
cmk37a71502esu2l789seo8v6	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 2 on a standard die?	1/6	PROBABILITY	EASY	{dice,inequality,fraction}
cmk37a71502etu2l791yhkzcd	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number greater than 5 on a standard die?	1/6	PROBABILITY	EASY	{dice,inequality,fraction}
cmk37a71502euu2l7q9poeycf	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 9 red balls and 1 blue ball. What is the probability of picking a blue ball?	1/10	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502evu2l71psjqyi0	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 0 on a standard die?	0	PROBABILITY	EASY	{dice,impossible}
cmk37a71502ewu2l77rueat7p	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 2 red balls, 3 blue balls, and 5 green balls. What is the probability of picking a green ball?	1/2	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502exu2l79eos6cx4	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 4 red balls, 4 blue balls, and 2 green balls. What is the probability of picking a green ball?	1/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502eyu2l7jd6npchq	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 12 equal sections, 3 of which are red. What is the probability of landing on red?	1/4	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502ezu2l7y6ane0aw	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 1 or a 6 on a standard die?	1/3	PROBABILITY	EASY	{dice,or,fraction}
cmk37a71502f0u2l7ysrpgklz	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 3 or a 5 on a standard die?	1/3	PROBABILITY	EASY	{dice,or,fraction}
cmk37a71502f1u2l7oaizxsq6	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 5 red balls, 3 blue balls, and 2 green balls. What is the probability of picking a red ball?	1/2	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502f2u2l7qqmfetul	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 6 on a standard die?	5/6	PROBABILITY	EASY	{dice,inequality,fraction}
cmk37a71502f3u2l75gnu4k7y	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number greater than 1 on a standard die?	5/6	PROBABILITY	EASY	{dice,inequality,fraction}
cmk37a71502f4u2l7sz4dxxru	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 6 red balls, 2 blue balls, and 2 green balls. What is the probability of picking a red ball?	3/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502f5u2l7sh7z9fg8	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 8 equal sections, 4 of which are red. What is the probability of landing on red?	1/2	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502f6u2l79j6ojzpd	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 10 red balls and 5 blue balls. What is the probability of picking a blue ball?	1/3	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502f7u2l7unv9wg7a	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 8 red balls and 4 blue balls. What is the probability of picking a red ball?	2/3	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502f8u2l75be3h1j2	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 6 equal sections: 2 red, 3 blue, 1 green. What is the probability of landing on red?	1/3	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502f9u2l7en0coq91	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 2, 3, or 4 on a standard die?	1/2	PROBABILITY	EASY	{dice,or,fraction}
cmk37a71502fau2l7k9i1hbwm	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 1, 3, or 5 on a standard die?	1/2	PROBABILITY	EASY	{dice,or,fraction}
cmk37a71502fbu2l73nubvu3h	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 3 red balls, 4 blue balls, and 3 green balls. What is the probability of picking a blue ball?	2/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502fdu2l7fo893tl2	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of picking a consonant from the letters A, B, C, D, E?	3/5	PROBABILITY	EASY	{letters,consonant,fraction}
cmk37a71502feu2l75g0eiqfr	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 12 red balls and 8 blue balls. What is the probability of picking a red ball?	3/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502ffu2l7yy6jj73k	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 10 equal sections, 2 of which are red. What is the probability of landing on red?	1/5	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502fgu2l7z4u2aow9	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 2 on a standard die?	1/6	PROBABILITY	EASY	{dice,basic,fraction}
cmk37a71502fhu2l7na6m6xw8	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 4 on a standard die?	1/6	PROBABILITY	EASY	{dice,basic,fraction}
cmk37a71502fiu2l7bxwpznvg	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 7 red balls and 7 blue balls. What is the probability of picking a red ball?	1/2	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502fju2l72h4cclgl	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 6 red balls, 3 blue balls, and 1 green ball. What is the probability of picking a green ball?	1/10	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502fku2l75ut3v2dp	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 5 equal sections: 1 red, 1 blue, 1 green, 1 yellow, 1 orange. What is the probability of landing on yellow?	1/5	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502flu2l7apybva2p	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 5 or a 6 on a standard die?	1/3	PROBABILITY	EASY	{dice,or,fraction}
cmk37a71502fmu2l7dn8gmxbe	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of picking the letter A from the letters A, B, C, D, E, F?	1/6	PROBABILITY	EASY	{letters,basic,fraction}
cmk37a71502fnu2l7770gjehe	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of picking a vowel from the letters A, B, C?	1/3	PROBABILITY	EASY	{letters,vowel,fraction}
cmk37a71502fou2l7k0kik4di	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 15 red balls and 5 blue balls. What is the probability of picking a red ball?	3/4	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502fpu2l7ac408134	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 4 red balls and 16 blue balls. What is the probability of picking a red ball?	1/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502fqu2l7m6rlmeut	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 9 red balls, 3 blue balls, and 3 green balls. What is the probability of picking a red ball?	3/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502fru2l7j0vbmrde	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 2 red balls, 6 blue balls, and 2 green balls. What is the probability of picking a blue ball?	3/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502fsu2l7y8k07nqg	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 20 equal sections, 5 of which are red. What is the probability of landing on red?	1/4	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502ftu2l7p9g8xlur	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 1, 2, 3, 4, or 5 on a standard die?	5/6	PROBABILITY	EASY	{dice,or,fraction}
cmk37a71502fuu2l7c8tdt5gx	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 2, 4, or 6 on a standard die?	1/2	PROBABILITY	EASY	{dice,even,fraction}
cmk37a71502fvu2l74e1rznl0	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 1, 3, or 5 on a standard die?	1/2	PROBABILITY	EASY	{dice,odd,fraction}
cmk37a71502fwu2l70k63d0a1	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 5 red balls, 5 blue balls, and 5 green balls. What is the probability of picking a red ball?	1/3	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502fxu2l7b9cw6z56	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of picking a consonant from the letters A, E, I, O, U?	0	PROBABILITY	EASY	{letters,impossible}
cmk37a71502fyu2l74slaq0l6	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of picking a vowel from the letters A, E, I, O, U?	1	PROBABILITY	EASY	{letters,certain}
cmk37a71502fzu2l7ofrfsur3	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 11 red balls and 9 blue balls. What is the probability of picking a blue ball?	9/20	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502g0u2l79xx9jbez	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 14 red balls and 6 blue balls. What is the probability of picking a red ball?	7/10	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502g1u2l7fur893oh	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 3 red balls, 5 blue balls, and 7 green balls. What is the probability of picking a green ball?	7/15	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502g2u2l7401e81tk	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 16 equal sections, 4 of which are red. What is the probability of landing on red?	1/4	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502g3u2l74o4xrbtm	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of picking the letter E from the letters A, B, C, D, E, F, G?	1/7	PROBABILITY	EASY	{letters,basic,fraction}
cmk37a71502g4u2l7n0bel37i	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of picking a vowel from the letters A, B, C, D?	1/4	PROBABILITY	EASY	{letters,vowel,fraction}
cmk37a71502g5u2l7b64to0vt	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 16 red balls and 4 blue balls. What is the probability of picking a blue ball?	1/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502g6u2l7yuolmi11	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 18 red balls and 2 blue balls. What is the probability of picking a red ball?	9/10	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502g8u2l7t1sg13i0	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number between 1 and 6 (inclusive) on a standard die?	1	PROBABILITY	EASY	{dice,certain}
cmk37a71502g9u2l7cieb1wxj	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 9 equal sections: 3 red, 3 blue, 3 green. What is the probability of landing on red?	1/3	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502gau2l7dpkfc8mg	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 13 red balls and 7 blue balls. What is the probability of picking a red ball?	13/20	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502gbu2l74xspc2gz	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 6 red balls, 4 blue balls, and 5 green balls. What is the probability of picking a blue ball?	4/15	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502gcu2l7vdae5ulo	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 15 equal sections, 3 of which are red. What is the probability of landing on red?	1/5	PROBABILITY	EASY	{spinner,basic,fraction}
cmk37a71502gdu2l7y3nlsvjw	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of picking a consonant from the letters A, B, C, D, E, F?	2/3	PROBABILITY	EASY	{letters,consonant,fraction}
cmk37a71502geu2l7eveys0ac	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 1, 2, 3, or 4 on a standard die?	2/3	PROBABILITY	EASY	{dice,or,fraction}
cmk37a71502gfu2l7gz1uaesp	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of flipping a coin and getting heads? Express as a decimal.	0.5	PROBABILITY	MEDIUM	{coin,decimal}
cmk37a71502ggu2l7ctvkhol6	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 6 on a standard die? Express as a percentage.	16.67%	PROBABILITY	MEDIUM	{dice,percentage}
cmk37a71502ghu2l7wikwuaw6	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling an even number on a standard die? Express as a percentage.	50%	PROBABILITY	MEDIUM	{dice,even,percentage}
cmk37a71502giu2l7dcr71sw2	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 3 red balls and 7 blue balls. What is the probability of picking a red ball? Express as a decimal.	0.3	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71502gju2l73ksx65o6	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 4 red balls and 6 blue balls. What is the probability of picking a blue ball? Express as a percentage.	60%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71502gku2l7f6purxqq	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of NOT rolling a 6 on a standard die?	5/6	PROBABILITY	MEDIUM	{dice,not,complement}
cmk37a71502glu2l7srojt50y	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of NOT flipping heads on a coin?	1/2	PROBABILITY	MEDIUM	{coin,not,complement}
cmk37a71502gmu2l7szeo5s8v	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 2 red balls and 8 blue balls. What is the probability of NOT picking a red ball?	4/5	PROBABILITY	MEDIUM	{balls,not,complement}
cmk37a71502gnu2l7w4ywu5vb	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin twice. What is the probability of getting heads both times?	1/4	PROBABILITY	MEDIUM	{coin,two-events,independent}
cmk37a71502gou2l7l96l8mkk	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of rolling a 6 both times?	1/36	PROBABILITY	MEDIUM	{dice,two-events,independent}
cmk37a71502gpu2l79vujbrsr	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 1 on a standard die? Express as a decimal.	0.167	PROBABILITY	MEDIUM	{dice,decimal}
cmk37a71502gqu2l72s57mkol	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling an odd number on a standard die? Express as a percentage.	50%	PROBABILITY	MEDIUM	{dice,odd,percentage}
cmk37a71502gru2l7ukaqwtfc	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 1 red ball and 9 blue balls. What is the probability of picking a red ball? Express as a decimal.	0.1	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71502gsu2l7xrqyvxj3	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 7 red balls and 3 blue balls. What is the probability of picking a red ball? Express as a percentage.	70%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71502gtu2l78xrg6xe0	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of NOT rolling a 1 on a standard die?	5/6	PROBABILITY	MEDIUM	{dice,not,complement}
cmk37a71502guu2l7oov4eoe1	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of NOT rolling an even number on a standard die?	1/2	PROBABILITY	MEDIUM	{dice,not,complement}
cmk37a71502gvu2l7qoypt1lz	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 3 red balls and 7 blue balls. What is the probability of NOT picking a blue ball?	3/10	PROBABILITY	MEDIUM	{balls,not,complement}
cmk37a71502gwu2l711ciag3m	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin twice. What is the probability of getting tails both times?	1/4	PROBABILITY	MEDIUM	{coin,two-events,independent}
cmk37a71502gxu2l7pyijl8te	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of rolling a 1 both times?	1/36	PROBABILITY	MEDIUM	{dice,two-events,independent}
cmk37a71502gyu2l7e4adzt1z	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin twice. What is the probability of getting at least one head?	3/4	PROBABILITY	MEDIUM	{coin,two-events,at-least-one}
cmk37a71502gzu2l7yt7ivcc4	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 3 on a standard die? Express as a percentage.	16.67%	PROBABILITY	MEDIUM	{dice,percentage}
cmk37a71502h0u2l7u8lal4n8	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 4 on a standard die? Express as a decimal.	0.5	PROBABILITY	MEDIUM	{dice,inequality,decimal}
cmk37a71502h1u2l793l40yp1	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 5 red balls and 5 blue balls. What is the probability of picking a red ball? Express as a decimal.	0.5	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71j02lfu2l74gohqm0v	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 18:6.	3:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71602h3u2l7pz1tco0a	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of NOT rolling a 3 on a standard die?	5/6	PROBABILITY	MEDIUM	{dice,not,complement}
cmk37a71602h4u2l7c26jz0o0	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of NOT rolling an odd number on a standard die?	1/2	PROBABILITY	MEDIUM	{dice,not,complement}
cmk37a71602h5u2l7p43ly8s8	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 6 red balls and 4 blue balls. What is the probability of NOT picking a red ball?	2/5	PROBABILITY	MEDIUM	{balls,not,complement}
cmk37a71602h6u2l7kvn1jxcj	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin twice. What is the probability of getting heads then tails?	1/4	PROBABILITY	MEDIUM	{coin,two-events,independent}
cmk37a71602h7u2l7yy7b9g5h	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of rolling a 2 both times?	1/36	PROBABILITY	MEDIUM	{dice,two-events,independent}
cmk37a71602h8u2l7nv59r677	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin twice. What is the probability of getting at least one tail?	3/4	PROBABILITY	MEDIUM	{coin,two-events,at-least-one}
cmk37a71602h9u2l7l6lv8oav	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 5 on a standard die? Express as a percentage.	16.67%	PROBABILITY	MEDIUM	{dice,percentage}
cmk37a71602hau2l7m0h4nr1j	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number greater than 3 on a standard die? Express as a decimal.	0.5	PROBABILITY	MEDIUM	{dice,inequality,decimal}
cmk37a71602hbu2l71zapok1q	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 9 red balls and 1 blue ball. What is the probability of picking a blue ball? Express as a decimal.	0.1	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71602hcu2l7a8nh7d60	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 1 red ball and 4 blue balls. What is the probability of picking a red ball? Express as a percentage.	20%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71602hdu2l7nce69c1d	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of NOT rolling a 5 on a standard die?	5/6	PROBABILITY	MEDIUM	{dice,not,complement}
cmk37a71602heu2l78gx3kbpo	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 7 red balls and 3 blue balls. What is the probability of NOT picking a blue ball?	7/10	PROBABILITY	MEDIUM	{balls,not,complement}
cmk37a71602hfu2l7jhgppz5i	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin twice. What is the probability of getting tails then heads?	1/4	PROBABILITY	MEDIUM	{coin,two-events,independent}
cmk37a71602hgu2l7d9hinjpr	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of rolling a 4 both times?	1/36	PROBABILITY	MEDIUM	{dice,two-events,independent}
cmk37a71602hhu2l7rxvsj735	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of getting at least one 6?	11/36	PROBABILITY	MEDIUM	{dice,two-events,at-least-one}
cmk37a71602hiu2l7j6rrzcsn	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 5 on a standard die? Express as a percentage.	66.67%	PROBABILITY	MEDIUM	{dice,inequality,percentage}
cmk37a71602hju2l7rper0c1x	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 2 on a standard die? Express as a decimal.	0.167	PROBABILITY	MEDIUM	{dice,decimal}
cmk37a71602hku2l799j7gfxf	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 6 red balls and 4 blue balls. What is the probability of picking a red ball? Express as a decimal.	0.6	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71602hlu2l7k3jd6lx3	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 3 red balls and 7 blue balls. What is the probability of picking a blue ball? Express as a percentage.	70%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71602hmu2l741gu02e5	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of NOT rolling a 2 on a standard die?	5/6	PROBABILITY	MEDIUM	{dice,not,complement}
cmk37a71602hnu2l72t7a8gmi	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 8 red balls and 2 blue balls. What is the probability of NOT picking a blue ball?	4/5	PROBABILITY	MEDIUM	{balls,not,complement}
cmk37a71602hou2l712t2lerz	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin three times. What is the probability of getting heads all three times?	1/8	PROBABILITY	MEDIUM	{coin,three-events,independent}
cmk37a71602hpu2l7b3c6kn7e	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of rolling a 5 both times?	1/36	PROBABILITY	MEDIUM	{dice,two-events,independent}
cmk37a71602hqu2l7h6xjduae	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of getting at least one 1?	11/36	PROBABILITY	MEDIUM	{dice,two-events,at-least-one}
cmk37a71602hru2l7tdcletpo	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number greater than 4 on a standard die? Express as a percentage.	33.33%	PROBABILITY	MEDIUM	{dice,inequality,percentage}
cmk37a71602hsu2l74n2q0w5e	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 2 red balls and 3 blue balls. What is the probability of picking a red ball? Express as a percentage.	40%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71602htu2l7gvhz9yyj	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 4 on a standard die? Express as a decimal.	0.167	PROBABILITY	MEDIUM	{dice,decimal}
cmk37a71602huu2l7wdn67nnc	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 10 red balls and 5 blue balls. What is the probability of picking a blue ball? Express as a decimal.	0.333	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71602hvu2l7wxg4rk62	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of NOT rolling a 4 on a standard die?	5/6	PROBABILITY	MEDIUM	{dice,not,complement}
cmk37a71602hwu2l7uyfcm02b	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 9 red balls and 1 blue ball. What is the probability of NOT picking a red ball?	1/10	PROBABILITY	MEDIUM	{balls,not,complement}
cmk37a71602hyu2l77w4nyrb3	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of rolling a 3 both times?	1/36	PROBABILITY	MEDIUM	{dice,two-events,independent}
cmk37a71602hzu2l7iyb1r7gw	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of getting at least one 2?	11/36	PROBABILITY	MEDIUM	{dice,two-events,at-least-one}
cmk37a71602i0u2l7s5s2tqzr	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 3 on a standard die? Express as a percentage.	33.33%	PROBABILITY	MEDIUM	{dice,inequality,percentage}
cmk37a71602i1u2l7sl1b5vsd	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 4 red balls and 1 blue ball. What is the probability of picking a red ball? Express as a percentage.	80%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71602i2u2l781171s7a	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 11 red balls and 9 blue balls. What is the probability of picking a red ball? Express as a decimal.	0.55	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71602i3u2l7x00dretp	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 12 red balls and 8 blue balls. What is the probability of picking a red ball? Express as a decimal.	0.6	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71602i4u2l74x02wcls	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 5 red balls and 15 blue balls. What is the probability of picking a blue ball? Express as a percentage.	75%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71602i5u2l7jl6k2813	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 14 red balls and 6 blue balls. What is the probability of NOT picking a red ball?	3/10	PROBABILITY	MEDIUM	{balls,not,complement}
cmk37a71602i6u2l7qpzmblj4	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin three times. What is the probability of getting at least one head?	7/8	PROBABILITY	MEDIUM	{coin,three-events,at-least-one}
cmk37a71602i7u2l74nx4csdw	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of rolling a 6 then a 1?	1/36	PROBABILITY	MEDIUM	{dice,two-events,independent}
cmk37a71602i8u2l7zpq8xwnu	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of getting at least one 3?	11/36	PROBABILITY	MEDIUM	{dice,two-events,at-least-one}
cmk37a71602i9u2l7bza2sntc	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number greater than 2 on a standard die? Express as a percentage.	66.67%	PROBABILITY	MEDIUM	{dice,inequality,percentage}
cmk37a71602iau2l7uu2fca5f	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 13 red balls and 7 blue balls. What is the probability of picking a blue ball? Express as a decimal.	0.35	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71602ibu2l7cyjms4eb	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 16 red balls and 4 blue balls. What is the probability of picking a red ball? Express as a percentage.	80%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71602icu2l7wl1g5ve9	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin three times. What is the probability of getting at least one tail?	7/8	PROBABILITY	MEDIUM	{coin,three-events,at-least-one}
cmk37a71602idu2l7df80pn7f	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 15 red balls and 5 blue balls. What is the probability of picking a red ball? Express as a decimal.	0.75	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71602ieu2l70kvuo0if	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 18 red balls and 2 blue balls. What is the probability of picking a blue ball? Express as a percentage.	10%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71602ifu2l7vgw0i3jo	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 17 red balls and 3 blue balls. What is the probability of NOT picking a blue ball?	17/20	PROBABILITY	MEDIUM	{balls,not,complement}
cmk37a71602igu2l7z3vpr7rh	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of rolling a 1 then a 6?	1/36	PROBABILITY	MEDIUM	{dice,two-events,independent}
cmk37a71602ihu2l7nus8dy3u	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of getting at least one 4?	11/36	PROBABILITY	MEDIUM	{dice,two-events,at-least-one}
cmk37a71602iiu2l7ulel86vk	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 6 on a standard die? Express as a percentage.	83.33%	PROBABILITY	MEDIUM	{dice,inequality,percentage}
cmk37a71602iju2l7a0w5du3b	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of rolling a 2 then a 5?	1/36	PROBABILITY	MEDIUM	{dice,two-events,independent}
cmk37a71602iku2l775t5ener	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of getting at least one 5?	11/36	PROBABILITY	MEDIUM	{dice,two-events,at-least-one}
cmk37a71602ilu2l7bo46xrln	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 19 red balls and 1 blue ball. What is the probability of picking a red ball? Express as a decimal.	0.95	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71602imu2l7h73rew2n	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 1 red ball and 19 blue balls. What is the probability of picking a blue ball? Express as a percentage.	95%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71602inu2l7ql5wlc5d	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 5 red, 3 blue, and 2 green balls. You pick one ball. What is the probability it is NOT green?	4/5	PROBABILITY	HARD	{balls,not,three-colors}
cmk37a71602iou2l7fd2fajgw	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 4 red, 4 blue, and 4 green balls. You pick one ball. What is the probability it is red OR blue?	2/3	PROBABILITY	HARD	{balls,or,three-colors}
cmk37a71602ipu2l7lrurtzg0	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll two dice. What is the probability that their sum is 7?	1/6	PROBABILITY	HARD	{two-dice,sum}
cmk37a71602iqu2l7getvi7yf	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll two dice. What is the probability that their sum is 10?	1/12	PROBABILITY	HARD	{two-dice,sum}
cmk37a71j02lgu2l7rfjpafsx	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 8:2.	4:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71602isu2l7p59y2cru	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A deck has 10 cards: 5 red and 5 black. You pick one card. If it's red, what is the probability the next card (without replacement) is also red?	4/9	PROBABILITY	HARD	{cards,conditional,without-replacement}
cmk37a71602itu2l7bneiyzrv	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin 4 times. What is the probability of getting exactly 2 heads?	3/8	PROBABILITY	HARD	{coin,exactly,binomial}
cmk37a71602iuu2l78dog1z6m	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 7 red balls and 3 blue balls. You pick two balls without replacement. What is the probability both are blue?	1/15	PROBABILITY	HARD	{balls,without-replacement,dependent}
cmk37a71602ivu2l7xhe6zorb	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die 3 times. What is the probability of rolling at least one 6?	91/216	PROBABILITY	HARD	{dice,three-events,at-least-one}
cmk37a71602iwu2l72ycmfi5e	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 3 red, 4 blue, and 5 green balls. You pick one ball. What is the probability it is red OR green?	2/3	PROBABILITY	HARD	{balls,or,three-colors}
cmk37a71602ixu2l7cxvcv9ny	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 6 red, 2 blue, and 2 green balls. You pick one ball. What is the probability it is NOT red?	2/5	PROBABILITY	HARD	{balls,not,three-colors}
cmk37a71602iyu2l7n4hvzhlm	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 5 red, 5 blue, and 5 green balls. You pick one ball. What is the probability it is blue OR green?	2/3	PROBABILITY	HARD	{balls,or,three-colors}
cmk37a71602izu2l73x1ssge7	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll two dice. What is the probability that their sum is 8?	5/36	PROBABILITY	HARD	{two-dice,sum}
cmk37a71602j0u2l73hq9d3fm	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll two dice. What is the probability that their sum is 11?	1/18	PROBABILITY	HARD	{two-dice,sum}
cmk37a71602j1u2l7aicnwnwt	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 5 red balls and 5 blue balls. You pick one ball, do not replace it, then pick another. What is the probability both are blue?	2/9	PROBABILITY	HARD	{balls,without-replacement,dependent}
cmk37a71602j2u2l7x18a2vtn	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A deck has 12 cards: 6 red and 6 black. You pick one card. If it's black, what is the probability the next card (without replacement) is also black?	5/11	PROBABILITY	HARD	{cards,conditional,without-replacement}
cmk37a71602j3u2l7su9awr4x	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin 4 times. What is the probability of getting exactly 3 heads?	1/4	PROBABILITY	HARD	{coin,exactly,binomial}
cmk37a71602j4u2l78itnbqi0	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 8 red balls and 2 blue balls. You pick two balls without replacement. What is the probability both are red?	28/45	PROBABILITY	HARD	{balls,without-replacement,dependent}
cmk37a71602j5u2l7egz0fp3p	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die 4 times. What is the probability of rolling at least one 6?	671/1296	PROBABILITY	HARD	{dice,four-events,at-least-one}
cmk37a71602j6u2l7jclduv31	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 2 red, 5 blue, and 3 green balls. You pick one ball. What is the probability it is NOT blue?	1/2	PROBABILITY	HARD	{balls,not,three-colors}
cmk37a71602j7u2l749zibx7z	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 4 red, 3 blue, and 5 green balls. You pick one ball. What is the probability it is red OR blue?	7/12	PROBABILITY	HARD	{balls,or,three-colors}
cmk37a71602j8u2l7w9w2cj05	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll two dice. What is the probability that their sum is 9?	1/9	PROBABILITY	HARD	{two-dice,sum}
cmk37a71602j9u2l74zjfaa7i	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll two dice. What is the probability that their sum is 6?	5/36	PROBABILITY	HARD	{two-dice,sum}
cmk37a71602jau2l7bqavhbxi	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 7 red balls and 3 blue balls. You pick one ball, do not replace it, then pick another. What is the probability the first is red and the second is blue?	7/30	PROBABILITY	HARD	{balls,without-replacement,dependent}
cmk37a71602jbu2l7okcrpbnn	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A deck has 8 cards: 4 red and 4 black. You pick one card. If it's red, what is the probability the next card (without replacement) is black?	4/7	PROBABILITY	HARD	{cards,conditional,without-replacement}
cmk37a71602jcu2l7d9fl8dq6	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin 4 times. What is the probability of getting exactly 4 heads?	1/16	PROBABILITY	HARD	{coin,exactly,binomial}
cmk37a71602jdu2l7rsi7oyax	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 9 red balls and 1 blue ball. You pick two balls without replacement. What is the probability both are red?	4/5	PROBABILITY	HARD	{balls,without-replacement,dependent}
cmk37a71602jeu2l79lmepqy7	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 1 red, 6 blue, and 3 green balls. You pick one ball. What is the probability it is blue OR green?	9/10	PROBABILITY	HARD	{balls,or,three-colors}
cmk37a71602jfu2l7xbttrflh	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll two dice. What is the probability that their sum is 5?	1/9	PROBABILITY	HARD	{two-dice,sum}
cmk37a71602jgu2l7sccm8e26	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 7 red, 1 blue, and 2 green balls. You pick one ball. What is the probability it is NOT red?	3/10	PROBABILITY	HARD	{balls,not,three-colors}
cmk37a71602jhu2l7o40if5r8	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 3 red, 6 blue, and 3 green balls. You pick one ball. What is the probability it is red OR green?	1/2	PROBABILITY	HARD	{balls,or,three-colors}
cmk37a71602jiu2l7x8rkncky	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll two dice. What is the probability that their sum is 4?	1/12	PROBABILITY	HARD	{two-dice,sum}
cmk37a71602jju2l7w8ihsvfr	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll two dice. What is the probability that their sum is 12?	1/36	PROBABILITY	HARD	{two-dice,sum}
cmk37a71602jwu2l7foshfedm	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 10 red balls and 10 blue balls. What is the probability of picking a blue ball?	1/2	PROBABILITY	EASY	{balls,basic,fraction,set-11}
cmk37a71602jxu2l7za7tzaor	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number greater than 6 on a standard die?	0	PROBABILITY	EASY	{dice,impossible,set-11}
cmk37a71602jyu2l7gcimow9k	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A spinner has 7 equal sections: 1 red, 6 blue. What is the probability of landing on red?	1/7	PROBABILITY	EASY	{spinner,basic,fraction,set-11}
cmk37a71602jzu2l7o09ugy34	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 17 red balls and 3 blue balls. What is the probability of picking a blue ball?	3/20	PROBABILITY	EASY	{balls,basic,fraction,set-11}
cmk37a71602k0u2l79a4sk4nl	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of picking a vowel from the letters B, C, D, F, G?	0	PROBABILITY	EASY	{letters,impossible,set-11}
cmk37a71602jlu2l716qrcqs6	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A deck has 10 cards: 7 red and 3 black. You pick one card. If it's red, what is the probability the next card (without replacement) is also red?	2/3	PROBABILITY	HARD	{cards,conditional,without-replacement}
cmk37a71602jmu2l7h4j2dwsv	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin 5 times. What is the probability of getting exactly 2 heads?	5/16	PROBABILITY	HARD	{coin,exactly,binomial}
cmk37a71602jnu2l78fywbtp8	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 10 red balls and 2 blue balls. You pick two balls without replacement. What is the probability at least one is blue?	7/22	PROBABILITY	HARD	{balls,without-replacement,at-least-one}
cmk37a71602jou2l7dctzi61t	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 2 red, 3 blue, and 7 green balls. You pick one ball. What is the probability it is red OR blue?	5/12	PROBABILITY	HARD	{balls,or,three-colors}
cmk37a71602jpu2l732321yjk	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll two dice. What is the probability that their sum is 3?	1/18	PROBABILITY	HARD	{two-dice,sum}
cmk37a71602jqu2l7nkrwudj3	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 8 red, 3 blue, and 1 green ball. You pick one ball. What is the probability it is NOT green?	11/12	PROBABILITY	HARD	{balls,not,three-colors}
cmk37a71602jru2l7magi7gwf	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 6 red, 4 blue, and 2 green balls. You pick one ball. What is the probability it is blue OR green?	1/2	PROBABILITY	HARD	{balls,or,three-colors}
cmk37a71602jsu2l73c4r68f3	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll two dice. What is the probability that their sum is 2?	1/36	PROBABILITY	HARD	{two-dice,sum}
cmk37a71602jtu2l7rs833u7e	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 9 red balls and 3 blue balls. You pick one ball, do not replace it, then pick another. What is the probability both are different colors?	9/22	PROBABILITY	HARD	{balls,without-replacement,different}
cmk37a71602juu2l7khbafjaw	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin 5 times. What is the probability of getting exactly 3 heads?	5/16	PROBABILITY	HARD	{coin,exactly,binomial}
cmk37a71602jvu2l7np4i9sz3	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 11 red balls and 1 blue ball. You pick two balls without replacement. What is the probability at least one is red?	1	PROBABILITY	HARD	{balls,without-replacement,at-least-one,certain}
cmk37a71602k1u2l7jup9wzd3	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 2 on a standard die? Express as a percentage.	16.67%	PROBABILITY	MEDIUM	{dice,inequality,percentage}
cmk37a71602k2u2l74hcjfbcr	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 20 red balls and 5 blue balls. What is the probability of picking a red ball? Express as a percentage.	80%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71602k3u2l7fcdwnjg7	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of flipping a coin and getting tails? Express as a decimal.	0.5	PROBABILITY	MEDIUM	{coin,decimal}
cmk37a71602k4u2l73rsx9i8y	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 6 red balls and 14 blue balls. What is the probability of picking a blue ball? Express as a decimal.	0.7	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71602k5u2l71ju22pwn	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of NOT flipping tails on a coin?	1/2	PROBABILITY	MEDIUM	{coin,not,complement}
cmk37a71602k6u2l71vbdzug8	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 5 red balls and 5 blue balls. What is the probability of NOT picking a blue ball?	1/2	PROBABILITY	MEDIUM	{balls,not,complement}
cmk37a71602k7u2l7b9c7chuw	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin twice. What is the probability of getting different results (one head, one tail)?	1/2	PROBABILITY	MEDIUM	{coin,two-events,different}
cmk37a71602k8u2l7g0z76xtr	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die three times. What is the probability of rolling a 1 all three times?	1/216	PROBABILITY	MEDIUM	{dice,three-events,independent}
cmk37a71602k9u2l75mdoyvt0	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number greater than 5 on a standard die? Express as a decimal.	0.167	PROBABILITY	MEDIUM	{dice,inequality,decimal}
cmk37a71602kau2l7ob4i0mu9	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 7 red balls and 13 blue balls. What is the probability of picking a blue ball? Express as a decimal.	0.65	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71602kbu2l7ytoc0hz9	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 9 red balls and 11 blue balls. What is the probability of picking a red ball? Express as a decimal.	0.45	PROBABILITY	MEDIUM	{balls,decimal}
cmk37a71602kcu2l7oevkp5d8	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 7 on a standard die? Express as a percentage.	100%	PROBABILITY	MEDIUM	{dice,certain,percentage}
cmk37a71j02lhu2l7e6c0v513	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 12:3.	4:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71702kku2l7xwtns01f	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die three times. What is the probability of rolling a 3 all three times?	1/216	PROBABILITY	MEDIUM	{dice,three-events,independent,set-11}
cmk37a71602keu2l7c3eriv0k	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die three times. What is the probability of rolling a 2 all three times?	1/216	PROBABILITY	MEDIUM	{dice,three-events,independent}
cmk37a71602kfu2l7haadzlom	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 10 red balls and 10 blue balls. What is the probability of NOT picking a red ball?	1/2	PROBABILITY	MEDIUM	{balls,not,complement}
cmk37a71602kgu2l7wgovebsv	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of rolling a 3 then a 4?	1/36	PROBABILITY	MEDIUM	{dice,two-events,independent}
cmk37a71702khu2l7ow0ve9cc	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of rolling a 4 then a 3?	1/36	PROBABILITY	MEDIUM	{dice,two-events,independent}
cmk37a71702kiu2l7yrruvo6s	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You roll a die twice. What is the probability of rolling a 5 then a 6?	1/36	PROBABILITY	MEDIUM	{dice,two-events,independent}
cmk37a71702kju2l7zlxc1sf8	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin twice. What is the probability of getting the same result both times?	1/2	PROBABILITY	MEDIUM	{coin,two-events,same}
cmk37a71702klu2l7z0zuy8h3	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 9 red, 2 blue, and 1 green ball. You pick one ball. What is the probability it is NOT blue?	5/6	PROBABILITY	HARD	{balls,not,three-colors}
cmk37a71702kmu2l71sxk4lgn	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 7 red, 5 blue, and 3 green balls. You pick one ball. What is the probability it is red OR green?	2/3	PROBABILITY	HARD	{balls,or,three-colors}
cmk37a71702knu2l7f4tg9hrk	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin 5 times. What is the probability of getting exactly 4 heads?	5/32	PROBABILITY	HARD	{coin,exactly,binomial}
cmk37a71702kou2l7mdk7mnhv	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin 5 times. What is the probability of getting exactly 5 heads?	1/32	PROBABILITY	HARD	{coin,exactly,binomial}
cmk37a71702kpu2l7jtco21v5	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin 3 times. What is the probability of getting exactly 2 heads?	3/8	PROBABILITY	HARD	{coin,exactly,binomial}
cmk37a71j02kqu2l7kwlq517e	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 4:2.	2:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02kru2l7guw8kzyb	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 6:3.	2:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02ksu2l7xsdwy2og	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 10:5.	2:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02ktu2l7lbchk3g7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 8:4.	2:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02kuu2l7apobd18u	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 6:4.	3:2	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02kvu2l7a8hm6yn2	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 9:6.	3:2	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02kwu2l7x2k566cf	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 12:8.	3:2	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02kxu2l7t5cisfsq	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 15:10.	3:2	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02kyu2l773m14uhe	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 6:9.	2:3	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02kzu2l71ax0rep1	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 8:12.	2:3	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02l0u2l7olgb1u1x	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 10:15.	2:3	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02l1u2l71uus31i3	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 4:6.	2:3	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02l2u2l7atit4f7d	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 5:10.	1:2	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02l3u2l7kzadxegw	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 3:6.	1:2	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02l4u2l7pk1w1bra	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 4:8.	1:2	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02l5u2l7jzjs99h7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 7:14.	1:2	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02l6u2l7uksoz1qr	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 12:6.	2:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02l7u2l7ae9kve79	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 16:8.	2:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02l8u2l75z2u91fx	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 20:10.	2:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02l9u2l7pwkk8zmo	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 14:7.	2:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02lau2l78euv9710	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Write the ratio 3 to 5 using colon notation.	3:5	RATIO_RATES	EASY	{write-ratio,notation}
cmk37a71j02lbu2l7a1o9cyp7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Write the ratio 7 to 2 using colon notation.	7:2	RATIO_RATES	EASY	{write-ratio,notation}
cmk37a71j02lcu2l7jf6n7doi	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 9:3.	3:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02ldu2l75b2x8sqg	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 12:4.	3:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02lju2l7nk13y31k	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 20:5.	4:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02lku2l7hcihzeuz	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 10:2.	5:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02llu2l7wigbfrc0	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 15:3.	5:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02lmu2l7lulsfz9n	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 20:4.	5:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02lnu2l77gmjv511	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 25:5.	5:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02lou2l7o8etwrot	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 14:2.	7:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02lpu2l7339r59t0	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 21:3.	7:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02lqu2l7lz6zc8zk	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 2:10.	1:5	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02lru2l7g8c7q51v	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 3:15.	1:5	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02lsu2l7g69k98ss	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 4:12.	1:3	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02ltu2l7i8b4stg4	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 5:15.	1:3	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71j02luu2l79o23cvxw	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Are the ratios 2:3 and 4:6 equivalent?	Yes	RATIO_RATES	EASY	{equivalent-ratios}
cmk37a71j02lvu2l77b6rvt62	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Are the ratios 1:2 and 3:6 equivalent?	Yes	RATIO_RATES	EASY	{equivalent-ratios}
cmk37a71j02lwu2l7pcsm70q7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Are the ratios 3:4 and 6:8 equivalent?	Yes	RATIO_RATES	EASY	{equivalent-ratios}
cmk37a71j02lxu2l79skeb3rj	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Are the ratios 2:5 and 4:10 equivalent?	Yes	RATIO_RATES	EASY	{equivalent-ratios}
cmk37a71j02lyu2l7qds6eav7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Are the ratios 1:3 and 2:6 equivalent?	Yes	RATIO_RATES	EASY	{equivalent-ratios}
cmk37a71j02lzu2l7bniwvbhh	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 18:12.	3:2	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02m0u2l7v4tjmlyu	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 20:12.	5:3	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02m1u2l7b9bmlkbj	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 15:9.	5:3	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02m2u2l7g089ioo4	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 10:6.	5:3	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02m3u2l7c8jxskcl	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 25:15.	5:3	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02m4u2l7sq2sws89	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 14:10.	7:5	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02m5u2l7lnlpsicz	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 21:15.	7:5	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02m6u2l7zlwyfnst	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 28:20.	7:5	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02m7u2l7wuug5bat	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 12:10.	6:5	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02m8u2l7f61wm6qu	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 18:15.	6:5	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02m9u2l7riege2it	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 24:20.	6:5	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02mau2l7mqhqa2jq	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 16:12.	4:3	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02mbu2l713x7g8ov	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 20:15.	4:3	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02mcu2l7lfg1phtr	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 24:18.	4:3	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71j02mdu2l73d9re2l7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 28:21.	4:3	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02meu2l7meskmiad	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	What is the ratio 5:1 doubled?	10:2 or 5:1	RATIO_RATES	EASY	{scale-ratio}
cmk37a71k02mfu2l7l5uigud5	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 30:20.	3:2	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mgu2l7udwha9rr	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 40:20.	2:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mhu2l7vleq3s7h	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 30:10.	3:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02miu2l72zyt62pc	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 40:10.	4:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mju2l7zuzz5bgp	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 50:10.	5:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mku2l7fqzf1ykq	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 24:8.	3:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mlu2l7vbtq4ali	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 27:9.	3:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mmu2l72n3path9	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 30:6.	5:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mnu2l7w1pdx15g	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 35:7.	5:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mou2l75qgfsxj8	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 36:12.	3:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mqu2l7s2ub8h0v	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 45:9.	5:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mru2l76214jq5v	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 32:8.	4:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02msu2l73kl8m8nq	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 28:7.	4:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mtu2l7dpd3vbj7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 24:6.	4:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02muu2l7jinbkiyh	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 22:11.	2:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mvu2l74e869dt6	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 26:13.	2:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mwu2l78qob30m7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 30:15.	2:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02mxu2l7sk9vphd0	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 33:11.	3:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02myu2l7v6clfatp	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 14:14.	1:1	RATIO_RATES	EASY	{simplify-ratio,equal-parts}
cmk37a71k02mzu2l70rmvhvvv	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 20:20.	1:1	RATIO_RATES	EASY	{simplify-ratio,equal-parts}
cmk37a71k02n0u2l7zulbvjfb	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 25:25.	1:1	RATIO_RATES	EASY	{simplify-ratio,equal-parts}
cmk37a71k02n1u2l7o0miphdp	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 18:9.	2:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02n2u2l7jlkbibyl	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 27:18.	3:2	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02n3u2l72zw6p9c0	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 32:16.	2:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02n4u2l7ux015jwx	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 35:14.	5:2	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02n5u2l7f9v6p68s	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 40:16.	5:2	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02n6u2l7sd6p2ifm	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 45:18.	5:2	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02n7u2l7mznw4scv	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 28:14.	2:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02n8u2l7tw0pgz84	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 32:24.	4:3	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02n9u2l7spzgnh10	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 36:24.	3:2	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02nau2l7zh9raejf	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 40:24.	5:3	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02nbu2l7rcvh9tzi	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 42:28.	3:2	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02ncu2l7bx8q7bct	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 45:27.	5:3	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02ndu2l70gcgdxmb	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 48:32.	3:2	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02neu2l7eh4n3nf4	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 50:30.	5:3	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02nfu2l7wq4gltbf	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 42:21.	2:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02ngu2l78c06e0kb	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 48:24.	2:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02nhu2l7dh9xb2fg	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 20 in the ratio 1:1.	10 and 10	RATIO_RATES	MEDIUM	{divide-quantity,equal-parts}
cmk37a71k02niu2l7780w7roe	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 30 in the ratio 1:2.	10 and 20	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02nju2l7rpo3mz5f	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 40 in the ratio 1:3.	10 and 30	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02nku2l7vcy8ohyt	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 50 in the ratio 1:4.	10 and 40	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02nlu2l7lq7nc3pz	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 15 in the ratio 1:2.	5 and 10	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02nmu2l74mtdho7t	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 24 in the ratio 1:2.	8 and 16	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02nnu2l7vi36496g	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 36 in the ratio 1:2.	12 and 24	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02nou2l7bbxpik0g	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 21 in the ratio 1:2.	7 and 14	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02npu2l7vxvemx5v	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 25 in the ratio 2:3.	10 and 15	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02nqu2l792r3evft	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 35 in the ratio 2:3.	14 and 21	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02nru2l79k2n6bhz	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 40 in the ratio 3:5.	15 and 25	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02nsu2l7qkp0e709	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 32 in the ratio 3:5.	12 and 20	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02ntu2l75cw9i7x9	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 28 in the ratio 3:4.	12 and 16	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02nuu2l7p4vjaqci	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 42 in the ratio 3:4.	18 and 24	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02nvu2l78h0owdoi	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 45 in the ratio 4:5.	20 and 25	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02nwu2l7j7izrwfd	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 120km in 2 hours, what is its speed in km/h?	60 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71k02nyu2l7w3uhy7gh	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 3 books cost $21, what is the cost per book?	$7	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71k02nzu2l7bdf7ri0o	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 4 pens cost $12, what is the cost per pen?	$3	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71k02o0u2l7mcje1v95	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 6 pencils cost $18, what is the cost per pencil?	$3	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71k02o1u2l70gna0mcn	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 8 oranges cost $16, what is the cost per orange?	$2	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71k02o2u2l7ublp8cs6	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 60 in the ratio 2:3.	24 and 36	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02o3u2l7oxs50j85	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 45 in the ratio 2:3.	18 and 27	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02o4u2l7ei9yw9o3	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 50 in the ratio 2:3.	20 and 30	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02o5u2l7k2bw072p	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 35 in the ratio 3:4.	15 and 20	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02o6u2l7hu2pnpy7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 56 in the ratio 3:4.	24 and 32	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02o7u2l7jce2jlan	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 63 in the ratio 4:5.	28 and 35	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02o8u2l72urzo5aw	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 72 in the ratio 5:7.	30 and 42	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02o9u2l7f5mq6t5q	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 48 in the ratio 5:7.	20 and 28	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02oau2l7j3xbmtt1	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 2 books cost $30, what is the cost per book?	$15	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71k02obu2l7e1b7gulw	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 10 pens cost $25, what is the cost per pen?	$2.50	RATIO_RATES	MEDIUM	{rate,unit-price,decimal}
cmk37a71k02ocu2l7v07wvhjs	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 150km in 3 hours, what is its speed in km/h?	50 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71k02odu2l7or2ve1su	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 240km in 4 hours, what is its speed in km/h?	60 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71k02oeu2l74hsiot3k	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 180km in 3 hours, what is its speed in km/h?	60 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71k02ofu2l7ybw6gadc	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 80 in the ratio 3:5.	30 and 50	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02ogu2l7sofnfp4u	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 64 in the ratio 3:5.	24 and 40	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02ohu2l7op2a4vif	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 54 in the ratio 4:5.	24 and 30	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02oiu2l75irpxmk0	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 72 in the ratio 4:5.	32 and 40	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02oju2l7cmf3f3c9	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 90 in the ratio 4:5.	40 and 50	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02oku2l7xcsz8s0u	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 100 in the ratio 2:3.	40 and 60	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02olu2l717xjnue6	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 70 in the ratio 3:4.	30 and 40	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02omu2l7fmbrovxh	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 84 in the ratio 3:4.	36 and 48	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02onu2l7gx3p0pme	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 77 in the ratio 4:7.	28 and 49	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02oou2l7g7yggf9i	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 55 in the ratio 5:6.	25 and 30	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02opu2l7pu5k2oaz	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 7 apples cost $21, what is the cost per apple?	$3	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71k02oqu2l7rh3x3nfo	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 9 pencils cost $27, what is the cost per pencil?	$3	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71k02oru2l73k2p07wi	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 200km in 4 hours, what is its speed in km/h?	50 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71k02osu2l7bfxfzadc	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 300km in 5 hours, what is its speed in km/h?	60 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71k02otu2l71x930ngz	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 350km in 5 hours, what is its speed in km/h?	70 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71k02ouu2l7ftsfq2y3	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 66 in the ratio 5:6.	30 and 36	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02ovu2l7uak6gd9d	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 99 in the ratio 5:6.	45 and 54	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02owu2l7nunra5y0	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 88 in the ratio 5:6.	40 and 48	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02oxu2l7i65qqugo	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 96 in the ratio 5:7.	40 and 56	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02oyu2l7d6ug7s6e	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 84 in the ratio 5:7.	35 and 49	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02ozu2l76kdiaage	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 108 in the ratio 5:7.	45 and 63	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02p0u2l75dld2de2	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 65 in the ratio 3:10.	15 and 50	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02p1u2l77gagcodf	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 78 in the ratio 5:8.	30 and 48	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02p3u2l7tb12bce7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 104 in the ratio 6:7.	48 and 56	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02p4u2l7rtjixhu3	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 12 oranges cost $36, what is the cost per orange?	$3	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71k02p5u2l79tei2jw3	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 15 apples cost $45, what is the cost per apple?	$3	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71k02p6u2l7ifpemfqc	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 400km in 8 hours, what is its speed in km/h?	50 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71k02p7u2l7kqcuglxy	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 420km in 6 hours, what is its speed in km/h?	70 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71k02p8u2l72feaooxl	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 450km in 9 hours, what is its speed in km/h?	50 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71k02p9u2l72svwi4rv	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 117 in the ratio 6:7.	54 and 63	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02pau2l78dk1wits	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 120 in the ratio 5:7.	50 and 70	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02pbu2l7ss4m5zyi	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 130 in the ratio 5:8.	50 and 80	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02pcu2l7s8ozl2h8	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 144 in the ratio 7:9.	63 and 81	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02pdu2l7cxks844m	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 126 in the ratio 4:5.	56 and 70	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02peu2l7la0n0zsp	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 135 in the ratio 4:5.	60 and 75	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02pfu2l72ejaijva	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 140 in the ratio 3:4.	60 and 80	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02pgu2l70huo85m1	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 150 in the ratio 2:3.	60 and 90	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02phu2l77q1i6xre	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 160 in the ratio 3:5.	60 and 100	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02piu2l7acku2dj3	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 3kg for $12 or 5kg for $18?	5kg for $18	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71k02pju2l7pjjq94hc	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 2L for $6 or 5L for $14?	5L for $14	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71k02pku2l740yfjz6v	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 4 apples for $8 or 6 apples for $10?	6 apples for $10	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71k02plu2l7q60s641h	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 200g for $4 or 500g for $9?	500g for $9	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71k02pmu2l7zmnpy4wv	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide $120 between Amy and Ben in the ratio 3:5. How much does Amy get?	$45	RATIO_RATES	HARD	{divide-money,word-problem}
cmk37a71k02pnu2l7y0qkbuqr	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide $120 between Amy and Ben in the ratio 3:5. How much does Ben get?	$75	RATIO_RATES	HARD	{divide-money,word-problem}
cmk37a71k02pou2l7hvppjbhh	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	A recipe uses flour and sugar in the ratio 3:2. If you use 9 cups of flour, how many cups of sugar do you need?	6 cups	RATIO_RATES	HARD	{ratio-word-problem,scaling}
cmk37a71k02ppu2l7luiado98	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	A recipe uses flour and sugar in the ratio 5:2. If you use 15 cups of flour, how many cups of sugar do you need?	6 cups	RATIO_RATES	HARD	{ratio-word-problem,scaling}
cmk37a71k02pqu2l7qd6guagf	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 360km in 6 hours, how far will it travel in 9 hours at the same speed?	540 km	RATIO_RATES	HARD	{rate,speed,scaling}
cmk37a71k02pru2l7gcr57y39	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 8 workers can complete a job in 12 days, how long will 6 workers take?	16 days	RATIO_RATES	HARD	{inverse-ratio,workers}
cmk37a71k02psu2l7thchujfh	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 250g for $5 or 600g for $11?	600g for $11	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71k02ptu2l71nqpbxpz	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 1kg for $8 or 3kg for $22?	3kg for $22	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71k02puu2l7m59jo406	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 500mL for $3 or 1.5L for $8?	1.5L for $8	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71k02pvu2l7t5zzz8b7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide $180 between Tom and Sarah in the ratio 2:7. How much does Tom get?	$40	RATIO_RATES	HARD	{divide-money,word-problem}
cmk37a71k02pwu2l734gfm6i4	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide $180 between Tom and Sarah in the ratio 2:7. How much does Sarah get?	$140	RATIO_RATES	HARD	{divide-money,word-problem}
cmk37a71k02pxu2l769f5s22k	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	A recipe uses oil and vinegar in the ratio 4:3. If you use 12mL of oil, how much vinegar do you need?	9 mL	RATIO_RATES	HARD	{ratio-word-problem,scaling}
cmk37a71k02pyu2l7kca3pqpr	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a printer prints 240 pages in 4 minutes, how many pages will it print in 7 minutes?	420 pages	RATIO_RATES	HARD	{rate,printing,scaling}
cmk37a71k02pzu2l75lsalgtb	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 5 machines can make 100 items in 2 hours, how many items can 8 machines make in 2 hours?	160 items	RATIO_RATES	HARD	{rate,direct-proportion}
cmk37a71k02q0u2l7wmplld5y	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car uses 6L of fuel for 90km, how much fuel does it use for 120km?	8 L	RATIO_RATES	HARD	{rate,fuel-consumption,scaling}
cmk37a71k02q1u2l7h2j1wkvp	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 800g for $12 or 1.2kg for $16?	1.2kg for $16	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71k02q3u2l7hwoq2uqv	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 4L for $10 or 9L for $21?	4L for $10	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71l02q4u2l7fn0czsap	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide $240 between Mike and Lisa in the ratio 5:3. How much does Mike get?	$150	RATIO_RATES	HARD	{divide-money,word-problem}
cmk37a71l02q5u2l76r6rrfuz	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide $240 between Mike and Lisa in the ratio 5:3. How much does Lisa get?	$90	RATIO_RATES	HARD	{divide-money,word-problem}
cmk37a71l02q6u2l76z6t3k7n	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	A recipe uses butter and flour in the ratio 1:4. If you use 80g of flour, how much butter do you need?	20 g	RATIO_RATES	HARD	{ratio-word-problem,scaling}
cmk37a71l02q7u2l77pmoa071	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a tap fills a tank with 150L in 5 minutes, how much water flows in 8 minutes?	240 L	RATIO_RATES	HARD	{rate,flow-rate,scaling}
cmk37a71l02q8u2l7obrskqzq	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 6 workers complete a job in 10 days, how long will 15 workers take?	4 days	RATIO_RATES	HARD	{inverse-ratio,workers}
cmk37a71l02q9u2l752b51nmt	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 280km in 4 hours, how far will it travel in 5 hours at the same speed?	350 km	RATIO_RATES	HARD	{rate,speed,scaling}
cmk37a71l02qau2l7j1e93juy	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 6 books for $48 or 10 books for $75?	10 books for $75	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71l02qbu2l7e5nndhek	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 2kg for $14 or 5kg for $32?	5kg for $32	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71l02qcu2l73m2n2yqj	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 300mL for $4.50 or 750mL for $10.50?	750mL for $10.50	RATIO_RATES	HARD	{best-buy,unit-price,decimal}
cmk37a71l02qdu2l7jqtd0dtr	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide $350 between Jack and Emma in the ratio 3:4. How much does Jack get?	$150	RATIO_RATES	HARD	{divide-money,word-problem}
cmk37a71l02qeu2l7zzzijxb7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide $350 between Jack and Emma in the ratio 3:4. How much does Emma get?	$200	RATIO_RATES	HARD	{divide-money,word-problem}
cmk37a71l02qfu2l7s6vgk36q	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	A recipe uses milk and cream in the ratio 7:3. If you use 21mL of milk, how much cream do you need?	9 mL	RATIO_RATES	HARD	{ratio-word-problem,scaling}
cmk37a71l02qgu2l7gujqxof6	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 4 taps can fill a pool in 3 hours, how long will 6 taps take?	2 hours	RATIO_RATES	HARD	{inverse-ratio,taps}
cmk37a71l02qhu2l7m2yiaaho	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a factory produces 360 items in 6 hours, how many items does it produce in 9 hours?	540 items	RATIO_RATES	HARD	{rate,production,scaling}
cmk37a71l02qiu2l7r1t1mydf	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 1.5kg for $18 or 2.5kg for $28?	2.5kg for $28	RATIO_RATES	HARD	{best-buy,unit-price,decimal}
cmk37a71l02qju2l7t79zl9qf	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car uses 8L of fuel for 100km, how much fuel does it use for 175km?	14 L	RATIO_RATES	HARD	{rate,fuel-consumption,scaling}
cmk37a71l02qku2l7lj9odjtq	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide $420 between Peter and Kate in the ratio 4:3. How much does Peter get?	$240	RATIO_RATES	HARD	{divide-money,word-problem}
cmk37a71l02qlu2l7nupt79kx	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide $420 between Peter and Kate in the ratio 4:3. How much does Kate get?	$180	RATIO_RATES	HARD	{divide-money,word-problem}
cmk37a71l02qmu2l7yqj0xtsl	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 400g for $6 or 1kg for $14?	1kg for $14	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71l02qnu2l711ux6ddz	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 5 pencils for $12.50 or 8 pencils for $19.20?	5 pencils for $12.50	RATIO_RATES	HARD	{best-buy,unit-price,decimal}
cmk37a71l02qou2l7i5ky8q99	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	A recipe uses eggs and flour in the ratio 2:5. If you use 16 eggs, how many cups of flour do you need?	40 cups	RATIO_RATES	HARD	{ratio-word-problem,scaling}
cmk37a71l02qpu2l70notnaq7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 10 workers complete a job in 12 days, how long will 8 workers take?	15 days	RATIO_RATES	HARD	{inverse-ratio,workers}
cmk37a71l02qqu2l73uo7opr5	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a train travels 450km in 5 hours, how far will it travel in 7 hours at the same speed?	630 km	RATIO_RATES	HARD	{rate,speed,scaling}
cmk37a71l02qru2l72h8ym536	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide $560 between Anna and David in the ratio 5:9. How much does Anna get?	$200	RATIO_RATES	HARD	{divide-money,word-problem}
cmk37a71l02qsu2l7ntqgg674	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide $560 between Anna and David in the ratio 5:9. How much does David get?	$360	RATIO_RATES	HARD	{divide-money,word-problem}
cmk37a71l02qtu2l79hemk7s6	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a printer prints 180 pages in 3 minutes, how many pages will it print in 10 minutes?	600 pages	RATIO_RATES	HARD	{rate,printing,scaling}
cmk37a71l02quu2l7ipb0e39x	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 3 machines make 90 items in 6 hours, how many items can 5 machines make in 6 hours?	150 items	RATIO_RATES	HARD	{rate,direct-proportion}
cmk37a71l02qvu2l7xi7ou3zv	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 2L for $7.50 or 5L for $18?	5L for $18	RATIO_RATES	HARD	{best-buy,unit-price,decimal}
cmk37a71l02qwu2l7xoyt73kr	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 39:13.	3:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71l02qxu2l7nahq7upy	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 18 in the ratio 1:2.	6 and 12	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02qyu2l7xdj5glgg	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 27 in the ratio 1:2.	9 and 18	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02r0u2l7acbjoh1j	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 16 in the ratio 1:3.	4 and 12	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02r1u2l7pv7xpm41	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 20 in the ratio 1:4.	4 and 16	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02r2u2l76k3zvjso	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 10 pencils cost $20, what is the cost per pencil?	$2	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71l02r3u2l7jux7facw	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 12 books cost $60, what is the cost per book?	$5	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71l02r4u2l7vkf72xb8	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 160km in 2 hours, what is its speed in km/h?	80 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71l02r5u2l7798ynq5s	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 210km in 3 hours, what is its speed in km/h?	70 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71l02r6u2l7lu2k4iso	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 320km in 4 hours, what is its speed in km/h?	80 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71l02r7u2l7y20ywtyb	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 75 in the ratio 2:3.	30 and 45	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02r8u2l7vnh9c6m7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 85 in the ratio 2:3.	34 and 51	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02r9u2l7jd6iozn8	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 49 in the ratio 3:4.	21 and 28	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02rau2l7m96g56gp	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 98 in the ratio 3:4.	42 and 56	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02rbu2l7wttqnrik	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 81 in the ratio 4:5.	36 and 45	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02rcu2l7pda5ky16	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 20 apples cost $40, what is the cost per apple?	$2	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71l02rdu2l756xxxg2w	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 25 pens cost $75, what is the cost per pen?	$3	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71l02reu2l7t6z80kji	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 360km in 4 hours, what is its speed in km/h?	90 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71l02rfu2l79k2fo0e1	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 500km in 5 hours, what is its speed in km/h?	100 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71l02rgu2l7g7u85yr2	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 560km in 7 hours, what is its speed in km/h?	80 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71l02rhu2l73xmx4pqb	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 105 in the ratio 3:4.	45 and 60	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02riu2l7fk95i1t3	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 112 in the ratio 3:5.	42 and 70	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02rju2l718z7t2vi	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 114 in the ratio 5:6.	60 and 54	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02rku2l7ba2gbxaa	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 121 in the ratio 6:5.	66 and 55	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71l02rlu2l77i1j0zy2	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 30 books cost $150, what is the cost per book?	$5	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71l02rmu2l7bw0695k7	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If a car travels 600km in 10 hours, what is its speed in km/h?	60 km/h	RATIO_RATES	MEDIUM	{rate,speed}
cmk37a71l02rnu2l7mg5oyf5p	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 133 in the ratio 6:7.	66 and 77	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71x02rou2l7rgd2fwe8	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 5, find 3x + 7	22	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02rpu2l7ptvc9vom	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 4, find 2x + 3	11	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02rqu2l7m5x04zyw	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 6, find 5x	30	ALGEBRA_SUBSTITUTION	EASY	{single-variable,multiplication-only}
cmk37a71x02rru2l720w89n94	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 3, find 4x + 5	17	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02rsu2l7qvmqpddz	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 7, find 2x - 5	9	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02rtu2l7fpvj12oo	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 8, find 3x - 10	14	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02ruu2l7bkczzgsd	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 2, find 6x + 1	13	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02rvu2l7e65p9fcd	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 9, find x + 15	24	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02rwu2l74wriy9er	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 10, find 2x	20	ALGEBRA_SUBSTITUTION	EASY	{single-variable,multiplication-only}
cmk37a71x02rxu2l771xlz90w	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 5, find 7x	35	ALGEBRA_SUBSTITUTION	EASY	{single-variable,multiplication-only}
cmk37a71x02ryu2l7wgz76pxj	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 4, find x + 12	16	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02rzu2l7cp7s5z56	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 6, find 4x - 8	16	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02s0u2l75ewwzgcl	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 3, find 5x + 2	17	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02s1u2l7wqt6m2z1	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 7, find 3x - 6	15	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02s2u2l7qivc3f5w	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 8, find 2x + 9	25	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02s3u2l7zcxl4hi1	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 2, find 8x	16	ALGEBRA_SUBSTITUTION	EASY	{single-variable,multiplication-only}
cmk37a71x02s5u2l7w2o2oqjz	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 9, find 4x - 12	24	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02s6u2l7o1y9ii95	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 10, find x + 8	18	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02s7u2l73je5ko72	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 4, find 3x + 6	18	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02s8u2l7dvht2ec9	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 6, find 2x - 4	8	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02s9u2l7s57s79a1	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 3, find 7x + 1	22	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02sau2l7zbb4ylqu	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 7, find 5x - 10	25	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02sbu2l7x50ayg5t	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 8, find x - 5	3	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02scu2l7eewfjq1l	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 2, find 5x + 4	14	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02sdu2l7nvwv0fta	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 9, find 3x	27	ALGEBRA_SUBSTITUTION	EASY	{single-variable,multiplication-only}
cmk37a71x02seu2l7cbsqb7lk	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 5, find 6x - 8	22	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02sfu2l7or3c9ljc	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 4, find 7x + 3	31	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02sgu2l73jphws8c	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 6, find x + 9	15	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02shu2l7j3shvwqr	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 3, find 9x	27	ALGEBRA_SUBSTITUTION	EASY	{single-variable,multiplication-only}
cmk37a71x02siu2l798gza42o	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 7, find x + 11	18	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02sju2l7nqt2dpm0	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 8, find 4x - 15	17	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02sku2l7cg82in0w	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 2, find 10x	20	ALGEBRA_SUBSTITUTION	EASY	{single-variable,multiplication-only}
cmk37a71x02slu2l7xicpygqz	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 9, find 2x + 7	25	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02smu2l76irtn6u5	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 10, find 3x - 5	25	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02snu2l7d0885fzw	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 5, find 4x + 8	28	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02sou2l784hc01fe	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 4, find x - 1	3	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02spu2l79gfl9pzc	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 6, find 3x + 4	22	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02squ2l7cpndv403	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 3, find 8x - 4	20	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02sru2l73bxcflz2	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 7, find 6x	42	ALGEBRA_SUBSTITUTION	EASY	{single-variable,multiplication-only}
cmk37a71x02ssu2l73gdifjys	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 8, find 5x + 6	46	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02stu2l7264al23c	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 2, find 7x - 3	11	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02suu2l7kcgx7nis	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 9, find x - 4	5	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02svu2l7eymxjh27	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 10, find 4x + 10	50	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02swu2l7wr35yarb	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 5, find 8x - 12	28	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02sxu2l7cmwj7i6i	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 4, find 9x	36	ALGEBRA_SUBSTITUTION	EASY	{single-variable,multiplication-only}
cmk37a71x02syu2l7o2ni0os0	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 6, find x + 7	13	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02szu2l7l964o5p6	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 3, find 6x + 9	27	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02t0u2l78gj3oy51	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 7, find 4x - 7	21	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02t1u2l74s3gosxx	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 8, find x + 6	14	ALGEBRA_SUBSTITUTION	EASY	{single-variable,addition}
cmk37a71x02t2u2l7cowm5oem	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -3, find 2x + 5	-1	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02t3u2l7xg7pw85s	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -2, find 3x + 10	4	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02t4u2l7zruszmio	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -5, find 4x - 3	-23	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02t5u2l7qsulg9og	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -4, find 2x + 12	4	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02t6u2l7e9hughqy	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -1, find 5x + 8	3	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02t7u2l79q1fdzp8	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -6, find 3x - 4	-22	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02t8u2l7cq7l9dej	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -2, find -2x + 7	11	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value,negative-coefficient}
cmk37a71x02t9u2l7ydn34r69	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -3, find -4x - 5	7	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value,negative-coefficient}
cmk37a71x02tbu2l7m4gtvlrw	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -4, find -5x - 8	12	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value,negative-coefficient}
cmk37a71x02tcu2l7buddywmt	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 12, find 3x - 15	21	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02tdu2l7r8pvz6yg	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 15, find 2x + 8	38	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02teu2l7ynlptmj7	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 20, find 4x - 25	55	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02tfu2l7kn2u8xaz	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 11, find 5x + 12	67	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02tgu2l7si08u1yl	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 13, find 6x - 18	60	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02thu2l7mcgdx3h3	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -7, find 2x + 20	6	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02tiu2l7nkw6fmjr	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -8, find 3x + 30	6	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02tju2l7q4r0cjbz	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -10, find 5x - 10	-60	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02tku2l7ck6aptvc	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -1, find -6x + 4	10	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value,negative-coefficient}
cmk37a71x02tlu2l7xa5f3olw	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -2, find -7x - 3	11	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value,negative-coefficient}
cmk37a71x02tmu2l7ly0ax36l	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 14, find 4x + 16	72	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02tnu2l74hscl777	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 16, find 3x - 20	28	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02tou2l750syyyth	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 18, find 2x + 14	50	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02tpu2l7oulw3l8g	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -3, find 5x + 18	3	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02tqu2l7z5m6fpuo	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -4, find 6x + 28	4	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02tru2l7q4ox867t	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -5, find -2x + 3	13	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value,negative-coefficient}
cmk37a71x02tsu2l7o3u2nrae	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -6, find -3x - 2	16	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value,negative-coefficient}
cmk37a71x02ttu2l7lqknhgm2	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 25, find 2x - 30	20	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02tuu2l7r9eisrx9	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 22, find 3x + 6	72	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02tvu2l7e5t4r9l2	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 17, find 5x - 25	60	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02twu2l7kzzgza3c	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -9, find 4x + 40	4	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02txu2l7jn0kcp9n	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -7, find -5x + 10	45	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value,negative-coefficient}
cmk37a71x02tyu2l7fb6k4bce	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -8, find -4x - 12	20	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value,negative-coefficient}
cmk37a71x02tzu2l73b4eiv75	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 19, find 4x - 26	50	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02u0u2l7oy49j8zk	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 21, find 3x + 9	72	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02u1u2l7fwxwq26n	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -10, find 2x + 25	5	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02u2u2l73k7nievm	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -12, find 3x + 40	4	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value}
cmk37a71x02u3u2l757b5wifc	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -11, find -6x + 6	72	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value,negative-coefficient}
cmk37a71x02u4u2l7891zvygq	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 24, find 5x - 40	80	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02u5u2l76sa41oxm	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 23, find 2x + 4	50	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,larger-numbers}
cmk37a71x02u6u2l7j3c9fx01	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 3 and y = 4, find 2x + 3y	18	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71x02u7u2l7es2peb88	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 5 and y = 2, find 4x + 5y	30	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71x02u8u2l7yztryv5w	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If a = 6 and b = 3, find 3a - 2b	12	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71x02u9u2l7xvjxxzhq	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 4 and y = 7, find 5x - 3y	-1	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71x02uau2l7d63n8sex	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If a = 2 and b = 8, find 6a + b	20	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71x02ubu2l7iiexi494	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 7 and y = 5, find 2x - y	9	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71x02ucu2l7gaetrwcw	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If p = 3 and q = 6, find 4p + 2q	24	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71x02udu2l72dwv9n8u	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 8 and y = 3, find 3x + 4y	36	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71x02ufu2l7gg70gq5r	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 10 and y = 4, find x + 6y	34	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71x02ugu2l7lwix0wju	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If m = 6 and n = 2, find 5m - 8n	14	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71x02uhu2l754w54lo7	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 4 and y = 5, find 3x + y	17	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71x02uiu2l7sbdy4p0j	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If a = 9 and b = 7, find 2a - 3b	-3	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71x02uju2l7hhk28lie	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 2 and y = 11, find 6x + 2y	34	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71x02uku2l79hbhu0lo	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If p = 7 and q = 4, find 4p - 5q	8	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71x02ulu2l7feygjocf	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 3 and y = 8, find x + y	11	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition,simple}
cmk37a71x02umu2l7xlgc9b2f	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If a = 12 and b = 5, find a - b	7	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction,simple}
cmk37a71x02unu2l7hfzzp0xu	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 6 and y = 9, find 5x + 3y	57	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71x02uou2l7upt1tvqe	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If m = 8 and n = 6, find 3m - 2n	12	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71x02upu2l72htqfkm3	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 5 and y = 10, find 2x + y	20	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71x02uqu2l7knus1g8t	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If a = 11 and b = 4, find 4a - 6b	20	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71x02uru2l7fk08o6jx	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 7 and y = 3, find 6x + 5y	57	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71x02usu2l7ype70jcn	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If p = 4 and q = 8, find 7p - 2q	12	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71y02utu2l7eccxp09h	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 9 and y = 6, find 3x - 4y	3	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71y02uuu2l7m0188w1t	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If a = 2 and b = 13, find 8a + b	29	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71y02uvu2l7dpq1e032	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 10 and y = 7, find 2x - 3y	-1	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71y02uwu2l7yogvsmzz	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If m = 5 and n = 12, find 4m + 3n	56	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71y02uxu2l7mhuqz2z2	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 6 and y = 11, find 5x - 2y	8	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71y02uyu2l74uzyl2m9	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If a = 8 and b = 9, find 3a + 2b	42	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71y02uzu2l7jjb46yf7	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 12 and y = 8, find 4x - 5y	8	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71y02v0u2l78jz7ikjh	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If p = 3 and q = 14, find 7p + q	35	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71y02v1u2l7g7t6jaim	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 11 and y = 5, find 3x - 6y	3	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71y02v2u2l7kaecqkss	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If a = 4 and b = 10, find 6a + 4b	64	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71y02v3u2l7eqlq16pg	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 13 and y = 9, find 2x - y	17	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71y02v4u2l7pbhjbkw4	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If m = 7 and n = 8, find 5m + 2n	51	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71y02v5u2l72mg8vt39	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 9 and y = 12, find 4x - 3y	0	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71y02v6u2l77jwdnzud	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If a = 5 and b = 6, find 8a - 7b	-2	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71y02v7u2l7dkihwtph	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 14 and y = 2, find 3x + 7y	56	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71y02v8u2l7ba598kif	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If p = 10 and q = 11, find 2p - q	9	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71y02v9u2l7j92d2qg2	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 4 and y = 15, find 9x + y	51	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,addition}
cmk37a71y02vau2l7bbkn53zb	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	P = 2l + 2w. Find P when l = 5 and w = 3	16	ALGEBRA_SUBSTITUTION	HARD	{formula,perimeter}
cmk37a71y02vbu2l756uh0r0a	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	A = lw. Find A when l = 8 and w = 4	32	ALGEBRA_SUBSTITUTION	HARD	{formula,area-rectangle}
cmk37a71y02vcu2l7ngvmbk1q	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	d = rt. Find d when r = 60 and t = 3	180	ALGEBRA_SUBSTITUTION	HARD	{formula,distance}
cmk37a71y02vdu2l7qt19unkv	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	V = lwh. Find V when l = 3, w = 4, and h = 5	60	ALGEBRA_SUBSTITUTION	HARD	{formula,volume}
cmk37a71y02veu2l7iyu02ne3	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	P = 2l + 2w. Find P when l = 7 and w = 4	22	ALGEBRA_SUBSTITUTION	HARD	{formula,perimeter}
cmk37a71y02vfu2l7smpch4l2	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	A = lw. Find A when l = 12 and w = 5	60	ALGEBRA_SUBSTITUTION	HARD	{formula,area-rectangle}
cmk37a71y02vgu2l7t8zzad46	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	d = rt. Find d when r = 50 and t = 4	200	ALGEBRA_SUBSTITUTION	HARD	{formula,distance}
cmk37a71y02vhu2l71s0hazaj	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	V = lwh. Find V when l = 5, w = 6, and h = 2	60	ALGEBRA_SUBSTITUTION	HARD	{formula,volume}
cmk37a71y02vju2l7yons2ch9	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	A = lw. Find A when l = 9 and w = 7	63	ALGEBRA_SUBSTITUTION	HARD	{formula,area-rectangle}
cmk37a71y02vku2l7oaurwjvm	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	d = rt. Find d when r = 75 and t = 2	150	ALGEBRA_SUBSTITUTION	HARD	{formula,distance}
cmk37a71y02vlu2l74nu3r9ta	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	V = lwh. Find V when l = 4, w = 3, and h = 7	84	ALGEBRA_SUBSTITUTION	HARD	{formula,volume}
cmk37a71y02vmu2l7nk9yg44o	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	P = 4s. Find P when s = 8	32	ALGEBRA_SUBSTITUTION	HARD	{formula,perimeter-square}
cmk37a71y02vnu2l7o4ed9txp	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	A = s². Find A when s = 6	36	ALGEBRA_SUBSTITUTION	HARD	{formula,area-square}
cmk37a71y02vou2l7op0k42rv	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	C = 2πr. Find C when r = 5 (use π = 3.14)	31.4	ALGEBRA_SUBSTITUTION	HARD	{formula,circumference}
cmk37a71y02vpu2l7xpemdqq0	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	P = 2l + 2w. Find P when l = 12 and w = 8	40	ALGEBRA_SUBSTITUTION	HARD	{formula,perimeter}
cmk37a71y02vqu2l7bbly42h6	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	A = lw. Find A when l = 15 and w = 4	60	ALGEBRA_SUBSTITUTION	HARD	{formula,area-rectangle}
cmk37a71y02vru2l7g3ba9vwn	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	d = rt. Find d when r = 80 and t = 5	400	ALGEBRA_SUBSTITUTION	HARD	{formula,distance}
cmk37a71y02vsu2l711txxna1	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	V = lwh. Find V when l = 6, w = 5, and h = 4	120	ALGEBRA_SUBSTITUTION	HARD	{formula,volume}
cmk37a71y02vtu2l7k903le9m	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	P = 4s. Find P when s = 12	48	ALGEBRA_SUBSTITUTION	HARD	{formula,perimeter-square}
cmk37a71y02vuu2l7488zw5s1	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	A = s². Find A when s = 9	81	ALGEBRA_SUBSTITUTION	HARD	{formula,area-square}
cmk37a71y02vvu2l7z36od3pg	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	C = 2πr. Find C when r = 7 (use π = 3.14)	43.96	ALGEBRA_SUBSTITUTION	HARD	{formula,circumference}
cmk37a71y02vwu2l73y7mlzqe	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	P = 2l + 2w. Find P when l = 9 and w = 5	28	ALGEBRA_SUBSTITUTION	HARD	{formula,perimeter}
cmk37a71y02vxu2l7qqdqgbp7	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	A = lw. Find A when l = 11 and w = 6	66	ALGEBRA_SUBSTITUTION	HARD	{formula,area-rectangle}
cmk37a71y02vyu2l7prqlbxsp	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	d = rt. Find d when r = 45 and t = 6	270	ALGEBRA_SUBSTITUTION	HARD	{formula,distance}
cmk37a71y02vzu2l75krh1o8z	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	V = lwh. Find V when l = 7, w = 8, and h = 3	168	ALGEBRA_SUBSTITUTION	HARD	{formula,volume}
cmk37a71y02w0u2l7sfgn0vli	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	P = 4s. Find P when s = 15	60	ALGEBRA_SUBSTITUTION	HARD	{formula,perimeter-square}
cmk37a71y02w1u2l7lpedhcsm	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	A = s². Find A when s = 10	100	ALGEBRA_SUBSTITUTION	HARD	{formula,area-square}
cmk37a71y02w2u2l78rg5ijxt	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	C = 2πr. Find C when r = 10 (use π = 3.14)	62.8	ALGEBRA_SUBSTITUTION	HARD	{formula,circumference}
cmk37a71y02w3u2l79ly4y8zf	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	P = 2l + 2w. Find P when l = 14 and w = 7	42	ALGEBRA_SUBSTITUTION	HARD	{formula,perimeter}
cmk37a71y02w4u2l7b413ta3y	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	A = lw. Find A when l = 13 and w = 8	104	ALGEBRA_SUBSTITUTION	HARD	{formula,area-rectangle}
cmk37a71y02w5u2l75ubv85hg	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	d = rt. Find d when r = 55 and t = 7	385	ALGEBRA_SUBSTITUTION	HARD	{formula,distance}
cmk37a71y02w6u2l7e93vcfsk	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	V = lwh. Find V when l = 8, w = 7, and h = 6	336	ALGEBRA_SUBSTITUTION	HARD	{formula,volume}
cmk37a71y02w7u2l7zbosq9pt	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	P = 4s. Find P when s = 9	36	ALGEBRA_SUBSTITUTION	HARD	{formula,perimeter-square}
cmk37a71y02w8u2l74i84h9zh	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	A = s². Find A when s = 11	121	ALGEBRA_SUBSTITUTION	HARD	{formula,area-square}
cmk37a71y02w9u2l78b9jojc0	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	C = 2πr. Find C when r = 4 (use π = 3.14)	25.12	ALGEBRA_SUBSTITUTION	HARD	{formula,circumference}
cmk37a71y02wau2l7q0rwd071	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	P = 2l + 2w. Find P when l = 11 and w = 9	40	ALGEBRA_SUBSTITUTION	HARD	{formula,perimeter}
cmk37a71y02wbu2l7iw9hmxly	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	A = lw. Find A when l = 14 and w = 9	126	ALGEBRA_SUBSTITUTION	HARD	{formula,area-rectangle}
cmk37a71y02wcu2l7hj3o4mf7	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	d = rt. Find d when r = 65 and t = 4	260	ALGEBRA_SUBSTITUTION	HARD	{formula,distance}
cmk37a71y02wdu2l75kzxzoij	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	V = lwh. Find V when l = 9, w = 6, and h = 8	432	ALGEBRA_SUBSTITUTION	HARD	{formula,volume}
cmk37cps30000u23vp646t2bb	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	2a + 3a	5a	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cps30001u23vcrpk4hzi	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	4x + 2x	6x	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cps30002u23vloidiefa	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	5m + 3m	8m	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cps30003u23vh8ror2y3	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	7y - 4y	3y	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cps30004u23vfllvoti9	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	9b - 2b	7b	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cps30005u23vufr5ja2m	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	3t + 4t + 2t	9t	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cps30006u23vd96957v7	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	6c + 2c + c	9c	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cps30007u23vb9bdkx76	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	8n - 3n + 2n	7n	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cps30008u23vapnib2c7	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	5k + 2k - 4k	3k	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cps3000au23vq5xk1vwu	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	2a + 3b + 4a	6a + 3b	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cps3000bu23vusipbske	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	5x + 2y + 3x	8x + 2y	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cps3000cu23vmaduqklr	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	4p + 3q + p + 2q	5p + 5q	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cps3000du23vzc822but	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	6m + 4n + 2m + n	8m + 5n	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cps3000eu23vyetrn8qx	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	3c + 5d + 2c + 3d	5c + 8d	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cps3000fu23vy1om0ot5	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	5x + 2y - 3x + 4y	2x + 6y	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cps3000gu23v27pwpr76	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	7a + 3b - 2a - b	5a + 2b	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cps3000hu23v3vp2rntf	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	4p + 6q + 2p + q	6p + 7q	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cps3000iu23vknn89dgs	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	8m - 5n + 3m + 2n	11m - 3n	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cps3000ju23v3xyv0wvu	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	6x + 4y - 2x - 3y	4x + y	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cps3000ku23vqc858mbu	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	3ab + 5ab - 2ab	6ab	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cps3000lu23v326tnz9v	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	7xy - 4xy + 2xy	5xy	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cps3000mu23vlg9qhm2t	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	4pq + 3pq - 6pq	pq	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cps3000nu23veaijk67f	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	5mn - mn + 2mn	6mn	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cps3000ou23vdjwy7th6	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	3x² + 2x + 4x² + 5x	7x² + 7x	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cps3000pu23vzlwpocec	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	6y² - 2y + 3y² + 4y	9y² + 2y	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cps3000qu23vifn0rggj	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	2a² + 5a - a² + 3a	a² + 8a	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cps3000ru23v7u9u8j7d	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	4m² - 3m + 2m² - m	6m² - 4m	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cps3000su23vsl8vjm0x	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	5x² + 3x - 2x² + x - 3x²	4x	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cps3000tu23v7rm81s4v	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	6a + 2a² - 3a + a² + 4a	3a² + 7a	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsc000uu23v3qrbyh96	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	4a + 5a	9a	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsc000vu23vohybkn4f	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	7x + 3x	10x	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsc000wu23vydj4ftvu	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	6m + 2m	8m	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsc000xu23v36dn4kmm	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	9y - 5y	4y	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsc000yu23vzeytbegv	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	8b - 3b	5b	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsc000zu23vpohvwkwu	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	4t + 3t + 5t	12t	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsc0010u23vetikdz7k	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	5c + 3c + 2c	10c	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsc0011u23vnzo5iqm7	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	7n - 4n + 3n	6n	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsc0012u23vc9l5r22w	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	6k + 3k - 5k	4k	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsc0013u23v11enspzq	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	8d - 3d - 4d	d	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsc0014u23v1g4yx2pi	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	3a + 4b + 5a	8a + 4b	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsc0015u23vpaagogm4	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	6x + 3y + 4x	10x + 3y	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsc0016u23v2ydjoel1	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	5p + 2q + 3p + 4q	8p + 6q	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsc0017u23vhgg5xgsv	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	7m + 3n + 4m + 2n	11m + 5n	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsc0018u23vhrebu0tg	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	4c + 6d + 3c + 2d	7c + 8d	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsc0019u23vaxx0djuf	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	3x + 4y - x + 2y	2x + 6y	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsc001au23vhsy31piz	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	6a + 2b - 4a - b	2a + b	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsc001bu23vt17vug2f	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	5p + 3q + 3p + 4q	8p + 7q	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsc001cu23vx6bygcgo	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	7m - 3n + 4m + 5n	11m + 2n	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsc001du23vt4f4v7aq	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	5x + 6y - 3x - 4y	2x + 2y	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsc001eu23vx4omtyn4	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	4ab + 6ab - 3ab	7ab	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsc001fu23vng34ubpx	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	8xy - 5xy + 3xy	6xy	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsc001gu23v3kftzham	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	6pq + 2pq - 7pq	pq	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsc001hu23vqcj62rgn	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	7mn - 2mn + 4mn	9mn	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsc001iu23vfmnthzzs	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	4x² + 3x + 5x² + 6x	9x² + 9x	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsc001ju23v9ne4wjwj	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	7y² - 3y + 4y² + 5y	11y² + 2y	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsc001ku23vgf7if685	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	3a² + 6a - 2a² + 4a	a² + 10a	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsc001lu23vex1xggx3	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	5m² - 4m + 3m² - 2m	8m² - 6m	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsc001mu23v01708gu1	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	6x² + 4x - 3x² + 2x - 2x²	x² + 6x	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsc001nu23v87ppbb2g	2026-01-06 23:10:05.964	2026-01-06 23:10:05.964	7a + 3a² - 4a + 2a² + 3a	5a² + 6a	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsf001ou23v730dcm25	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	5a + 2a	7a	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsf001pu23vgyx3h9av	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	7b + 3b	10b	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsf001qu23vj9v6u872	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	4c + 6c	10c	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsf001ru23vr22pv13s	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	8m + 5m	13m	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsf001su23vhzh96d27	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	3x + 4x	7x	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsf001tu23vgwbwtigg	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	9p + p	10p	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsf001uu23vwg4aj6gm	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	2q + 8q	10q	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsf001vu23vr7dmdstf	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	6t + 3t	9t	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsf001wu23vmkebfrxs	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	4u + 5u	9u	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsf001xu23vef0qhf8u	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	2v + 9v	11v	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsf001yu23v62aweypc	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	3a + 2b + 4a	7a + 2b	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsf001zu23vvzib9a69	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	5x + 3y + 2x	7x + 3y	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsf0020u23v33as74lm	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	4m + 6n + 3m	7m + 6n	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsf0021u23vt8hz4zvz	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	7p + 2q + 5p	12p + 2q	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsf0022u23vvpqw65rr	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	2a + 4b + 3a + 5b	5a + 9b	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsf0023u23vht8itn4o	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	6x + 3x + 2x	11x	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsf0024u23vca3ah5nx	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	4m + m + 5m	10m	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsf0025u23v017wctrv	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	9a + 2a + 3a	14a	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsf0026u23vkekyfxxg	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	7p + 4p + p	12p	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsf0027u23vfec0psj9	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	5y + 3y + 2y	10y	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsf0028u23vpsr5dpxx	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	3ab + 4ab	7ab	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsf0029u23voul2r6zr	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	5xy + 2xy	7xy	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsf002au23vxj015lbc	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	7mn + mn	8mn	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsf002bu23vcz196l2j	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	4pq + 6pq	10pq	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsf002cu23v9ijqa4xy	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	8rs + 3rs	11rs	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsf002du23vgso28y3b	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	2x² + 5x²	7x²	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsf002eu23vppysl7t1	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	3m² + 4m²	7m²	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsg002gu23vtkyahleb	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	4y² + 3y² + 5y²	12y²	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsg002hu23vh73orwbm	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	7x² + 2x + 3x² + 4x	10x² + 6x	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsj002iu23vrsmk7h4y	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	6a + 4a	10a	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsj002ju23vpx3lw01x	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	8b + 2b	10b	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsj002ku23vc8vmp3rr	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	3c + 9c	12c	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsj002lu23vrhlts6uu	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	7m + 6m	13m	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsj002mu23v1k6qafxy	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	4x + 8x	12x	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsj002nu23vz7tn9wwp	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	5p + 7p	12p	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsj002ou23vmueoz9jh	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	9q + 3q	12q	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsj002pu23vpv1b5avp	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	2t + 10t	12t	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsj002qu23vfkl5wlih	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	7u + 4u	11u	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsj002ru23vol9u1dfg	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	6v + 8v	14v	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsj002su23vtm0f9u4g	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	2a + 5b + 7a	9a + 5b	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsj002tu23vpcftibdd	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	6x + 4y + 3x	9x + 4y	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsj002uu23vu4tk9krt	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	5m + 3n + 2m	7m + 3n	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsj002vu23vl95piyb5	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	8p + 4q + 5p	13p + 4q	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsj002wu23vc4e1nuus	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	3a + 7b + 4a + 2b	7a + 9b	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsj002xu23v2tr8a434	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	7x + 5x + 3x	15x	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsj002yu23vu8p89z8k	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	5m + 2m + 4m	11m	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsj002zu23vdsghdnq7	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	8a + 3a + 2a	13a	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsj0030u23vzqcby5xo	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	6p + 4p + 2p	12p	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsj0031u23vtg1dpwv6	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	9y + 1y + 3y	13y	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsj0032u23vqmlycxhs	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	2ab + 3ab + 4ab	9ab	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsj0033u23v5j86jxue	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	6xy + 2xy + xy	9xy	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsj0034u23vmsc2yb6z	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	5mn + 3mn + 2mn	10mn	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsj0035u23vu660cbqb	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	8pq + 2pq + 3pq	13pq	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsj0036u23v7k3gu3ku	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	4rs + 6rs + 5rs	15rs	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsj0037u23v9m4fs115	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	3x² + 6x²	9x²	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsj0038u23v2amujbax	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	5m² + 4m²	9m²	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsj0039u23vingqhzv7	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	7a² + 2a² + 3a²	12a²	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsj003au23v95zs3pux	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	6y² + 3y² + 2y²	11y²	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsj003bu23v99nkz8zd	2026-01-06 23:10:05.971	2026-01-06 23:10:05.971	5x² + 3x + 2x² + 5x	7x² + 8x	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsm003cu23vaftlz337	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	8a + 3a	11a	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsm003du23v42b9nftr	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	7b + 5b	12b	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsm003eu23vzjld3hx1	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	4c + 7c	11c	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsm003fu23voiyou9o1	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	9m + 4m	13m	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsm003gu23vx34ohuuq	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	6x + 5x	11x	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsm003hu23vfbfhif7l	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	3p + 8p	11p	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsm003iu23vzdr7fkbn	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	7q + 6q	13q	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsm003ju23vrebgxbcv	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	5t + 7t	12t	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsm003ku23vovw23btr	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	8u + 3u	11u	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsm003lu23vd8beimus	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	4v + 9v	13v	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsm003mu23vytbmfp7g	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	3a + 4b + 6a	9a + 4b	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsm003nu23vnmakr2yr	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	7x + 5y + 2x	9x + 5y	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsn003ou23v3miiqwf3	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	6m + 2n + 5m	11m + 2n	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsn003pu23vtppct8ld	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	9p + 3q + 7p	16p + 3q	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsn003qu23v4p6b3xpt	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	5a + 8b + 2a + 3b	7a + 11b	ALGEBRA_COLLECTING_TERMS	MEDIUM	{multiple-variables}
cmk37cpsn003ru23vzmierblo	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	9x + 2x + 4x	15x	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsn003su23vbwmoz0w6	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	6m + 3m + 5m	14m	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsn003tu23vn4jl047u	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	10a + 2a + 1a	13a	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsn003uu23v6uup6o0y	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	8p + 3p + 5p	16p	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsn003vu23vzcvdaxxe	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	4y + 7y + 2y	13y	ALGEBRA_COLLECTING_TERMS	MEDIUM	{}
cmk37cpsn003wu23vwk6r8ny1	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	5ab + 2ab + 3ab	10ab	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsn003xu23vrtmbktul	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	4xy + 5xy + 2xy	11xy	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsn003yu23vb9mwmqad	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	7mn + 2mn + 4mn	13mn	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsn003zu23vudsp5sr1	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	6pq + 3pq + 2pq	11pq	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsn0040u23vynacbfv7	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	9rs + 1rs + 5rs	15rs	ALGEBRA_COLLECTING_TERMS	HARD	{multiple-variables,product-terms}
cmk37cpsn0041u23vn0mxo3xr	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	4x² + 5x²	9x²	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsn0042u23vbmlalb76	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	6m² + 3m²	9m²	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsn0043u23vwsuttbnf	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	5a² + 3a² + 4a²	12a²	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsn0044u23v4w4pun6y	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	8y² + 2y² + 3y²	13y²	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpsn0045u23vz3v1n87n	2026-01-06 23:10:05.975	2026-01-06 23:10:05.975	6x² + 4x + 3x² + 7x	9x² + 11x	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpst0046u23vp8xvyt87	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	3a × 4b	12ab	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpst0047u23v5t49h2ix	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	5m × 2n	10mn	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpst0048u23vztnh553e	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	6p × 3q	18pq	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpst0049u23v1ew06ubf	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	2x × 7y	14xy	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpst004au23vhget14pq	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	8a × 3b	24ab	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpst004bu23vwwu8tqfn	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	4c × 5d	20cd	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpst004cu23v79uprc90	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	7m × 2p	14mp	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpst004du23vfi1ipm7e	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	3s × 6t	18st	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpst004eu23vnlzgwnkh	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	9a × 4c	36ac	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpst004fu23v83e6h2b9	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	2u × 8v	16uv	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpst004gu23vl479dceu	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	3x × 2x²	6x³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpst004hu23ve1avu64f	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	4y × 3y²	12y³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpst004iu23vjzkd95ox	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	2a × 5a³	10a⁴	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpst004ju23vydqvdgtf	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	6m × 2m²	12m³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpst004ku23vmxcojjr1	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	5p × 4p²	20p³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpst004lu23vu71d7m9t	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	5x × x	5x²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpst004mu23veawtehr0	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	7y × y	7y²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpst004ou23v3hbug99g	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	9m × m	9m²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpst004pu23vfpn6tzhd	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	6t × t	6t²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpst004qu23vpfek0di8	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	2x × 3x	6x²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpst004ru23vq21icj1d	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	4a × 5a	20a²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpst004su23vwahysgd9	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	3y × 2y	6y²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpst004tu23v6w7qbvlk	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	5m × 4m	20m²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpst004uu23ve9wez0m5	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	7p × 2p	14p²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpst004vu23vg174ebyt	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	(2a)²	4a²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpst004wu23vb1v7sz1z	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	(3x)²	9x²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpst004xu23vt1nxkxes	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	(4m)²	16m²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpst004yu23vhd79imns	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	(2y)³	8y³	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpst004zu23vfafimenp	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	(3t)³	27t³	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpsx0050u23vo38z9gs9	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	2a × 5b	10ab	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpsx0051u23v21ksl3x5	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	6x × 3y	18xy	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpsx0052u23v0sul4wyn	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	4p × 2q	8pq	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpsx0053u23vgc3ecdu0	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	7m × 4n	28mn	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpsx0054u23vr2ulb7ld	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	9u × 2v	18uv	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpsx0055u23vkyg9cuxj	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	5d × 6e	30de	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpsx0056u23vu38vxbks	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	8h × 3k	24hk	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpsx0057u23voewcemvg	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	2r × 9s	18rs	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpsx0058u23vv9lgujr4	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	4t × 5w	20tw	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpsx0059u23vajref5k3	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	7b × 3c	21bc	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpsx005au23vpfb4rg25	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	2x × 4x²	8x³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpsx005bu23v8424jadk	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	5a × 3a²	15a³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpsx005cu23v7d3cz8xg	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	3m × 6m³	18m⁴	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpsx005du23vci4vwllh	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	4p × 2p²	8p³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpsx005eu23vvnf5yac6	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	6y × 5y²	30y³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpsx005fu23vu0gs30ah	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	3a × a	3a²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpsx005gu23vyh3ap1rv	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	8m × m	8m²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpsx005hu23vvc7wgc0e	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	5c × c	5c²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpsx005iu23vvbltbe65	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	2x × x	2x²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpsx005ju23vxkqjf72c	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	6y × y	6y²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpsx005ku23vsg7g03tc	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	3a × 2a	6a²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpsx005lu23vw66m5ooo	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	5x × 4x	20x²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpsx005mu23vwkxcj6xt	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	6m × 3m	18m²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpsx005nu23vax2f32vf	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	2p × 7p	14p²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpsx005ou23v8eq2etwp	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	4y × 2y	8y²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpsx005pu23vd4s0d0kv	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	(5a)²	25a²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpsx005qu23vzi73wgs6	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	(2x)²	4x²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpsx005ru23vdr2eymg4	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	(3y)²	9y²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpsx005su23vkxvntsqc	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	(4a)³	64a³	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpt0005uu23vd46bsvyk	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	4a × 3b	12ab	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt0005vu23vd3zls2hw	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	7x × 2y	14xy	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt0005wu23vbg9fx5i4	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	5m × 4n	20mn	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt0005xu23v6zbzmnbk	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	3p × 6q	18pq	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt0005yu23v38tbv7ke	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	8u × 2v	16uv	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt0005zu23v07i2v1rz	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	6d × 4e	24de	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt00060u23voofrqiwj	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	9h × 2k	18hk	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt00061u23vi6mzo6b5	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	5r × 4s	20rs	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt00062u23vrlbz29sk	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	7t × 3w	21tw	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt00063u23vjr9dalar	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	2b × 8c	16bc	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt00064u23v14njpfjb	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	3x × 5x²	15x³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpt00065u23vstqfzq0x	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	6a × 2a²	12a³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpt00066u23vobehjny4	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	4m × 3m³	12m⁴	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpt00067u23vhg1b0obj	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	5p × 4p²	20p³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpt00068u23vk1qpce2n	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	7y × 2y²	14y³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpt00069u23vyexqd4l0	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	2a × a	2a²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpt0006au23v51u5k5hq	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	9m × m	9m²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpt0006bu23vji9rt5hb	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	6c × c	6c²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpt0006cu23vbvyv917u	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	4x × x	4x²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpt0006du23v564y3fk3	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	7y × y	7y²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpt0006eu23vw3rd4ftu	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	4a × 3a	12a²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpt0006fu23vozx05l0r	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	6x × 2x	12x²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpt0006gu23vhti9vlsj	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	5m × 2m	10m²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpt0006hu23vxapv21d2	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	3p × 4p	12p²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpt0006iu23vvb1h7boh	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	8y × 1y	8y²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpt0006ju23vaiec3m0f	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	(4a)²	16a²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpt0006ku23v48cxzj0v	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	(5x)²	25x²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpt0006lu23v8cb6vqz9	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	(2y)²	4y²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpt0006mu23vwysv9qwn	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	(3a)³	27a³	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpt0006nu23vjybdfxet	2026-01-06 23:10:05.988	2026-01-06 23:10:05.988	(5m)²	25m²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpt3006ou23vq43xqdee	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	5a × 2b	10ab	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt3006pu23vsas5trvp	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	8x × 3y	24xy	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt3006qu23vk9qb8dy8	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	6m × 5n	30mn	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt3006ru23v8f674p23	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	4p × 7q	28pq	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt3006su23vobneh1gw	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	9u × 3v	27uv	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt3006tu23vv9glbv9b	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	7d × 5e	35de	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt3006uu23v6zap900r	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	8h × 4k	32hk	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt3006vu23vyhi5nq20	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	6r × 5s	30rs	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt3006wu23vdkh5txid	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	9t × 2w	18tw	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt3006xu23vum638ac1	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	3b × 7c	21bc	ALGEBRA_MULTIPLICATION	EASY	{multiple-variables}
cmk37cpt6007ju23vd4tesw51	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	2/10 + 5/10	7/10	FRACTION_ADDITION	EASY	{}
cmk37cpt6007ku23ve67s6nda	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	3/6 + 1/6	2/3	FRACTION_ADDITION	EASY	{single-digit-denominators}
cmk37cpt6007lu23vbswzu7o0	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	4/12 + 5/12	3/4	FRACTION_ADDITION	EASY	{}
cmk37cpt6007mu23v7dhmeqtx	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	2/7 + 3/7	5/7	FRACTION_ADDITION	EASY	{single-digit-denominators}
cmk37cpt6007nu23vh9xa4ekm	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	1/5 + 3/5	4/5	FRACTION_ADDITION	EASY	{single-digit-denominators}
cmk37cpt6007ou23vir2f9dt3	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	5/14 + 2/14	1/2	FRACTION_ADDITION	EASY	{}
cmk37cpt6007pu23vffw6xgpn	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	4/9 + 2/9	2/3	FRACTION_ADDITION	EASY	{single-digit-denominators}
cmk37cpt6007qu23v4r3tcydk	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	3/15 + 7/15	2/3	FRACTION_ADDITION	EASY	{}
cmk37cpt6007ru23vydsmjdze	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	2/11 + 5/11	7/11	FRACTION_ADDITION	EASY	{}
cmk37cpt6007su23vira8thdq	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	1 2/6 + 3/6	1 5/6	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpt6007tu23vu105tcio	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	2 1/8 + 5/8	2 3/4	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpt6007uu23vg16lbb7b	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	1 3/10 + 4/10	1 7/10	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpt6007vu23vjlvp738a	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	3 2/7 + 4/7	3 6/7	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpt6007wu23vuuajt8rg	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	2 5/12 + 7/12	3	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-question}
cmk37cpt6007xu23vea5gde1x	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	1 4/9 + 3/9	1 7/9	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpt6007yu23vy7udm0dk	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	3 1/5 + 2/5	3 3/5	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpt6007zu23vlkj7zzvj	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	2 3/14 + 8/14	2 11/14	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpt60080u23v2ckaie3y	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	1 5/16 + 7/16	1 3/4	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpt3006yu23vzl7w37n4	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	4x × 6x²	24x³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpt3006zu23v3h1m4ceb	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	7a × 3a²	21a³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpt30070u23vfkn1hzm8	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	5m × 4m³	20m⁴	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpt30071u23vtb465lui	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	6p × 3p²	18p³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpt30072u23vxb5clo2p	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	8y × 2y²	16y³	ALGEBRA_MULTIPLICATION	MEDIUM	{has-powers}
cmk37cpt30073u23vqc75sims	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	4a × a	4a²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpt30074u23vz2qajymq	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	5m × m	5m²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpt30075u23vtrgwztum	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	7c × c	7c²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpt30076u23vqlwdwtld	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	3x × x	3x²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpt30077u23vi1qfkp56	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	8y × y	8y²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpt30078u23vgxlu2vd0	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	5a × 2a	10a²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpt30079u23viv1n8kr5	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	7x × 3x	21x²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpt3007au23v2wigirlc	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	4m × 3m	12m²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpt3007bu23vokmqadxz	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	6p × 2p	12p²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpt3007cu23vc9f7tq3i	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	9y × 2y	18y²	ALGEBRA_MULTIPLICATION	HARD	{}
cmk37cpt3007du23vzbqrqfxn	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	(6a)²	36a²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpt3007eu23vjaezrlhe	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	(4x)²	16x²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpt3007fu23vy8gojkqw	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	(5y)²	25y²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpt3007gu23v8kvhtgzb	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	(2a)³	8a³	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpt3007hu23v1e9kesme	2026-01-06 23:10:05.991	2026-01-06 23:10:05.991	(4m)²	16m²	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cpt60082u23v70d8ct57	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	1 3/8 + 1 4/8	2 7/8	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpt60083u23v03n2s6zk	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	2 4/10 + 1 5/10	3 9/10	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpt60084u23vi7p2ivr0	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	1 2/7 + 2 3/7	3 5/7	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpt60085u23viv3jx36u	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	2 5/12 + 1 6/12	3 11/12	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpt60086u23v3g28d40d	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	3 1/6 + 2 4/6	5 5/6	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpt60087u23vlahf174l	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	3/5 + 4/5	1 2/5	FRACTION_ADDITION	EASY	{mixed-numbers-in-answer,results-in-mixed-number,single-digit-denominators}
cmk37cpt70088u23va9c0lr2y	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	5/9 + 7/9	1 1/3	FRACTION_ADDITION	EASY	{mixed-numbers-in-answer,results-in-mixed-number,single-digit-denominators}
cmk37cpt70089u23v4yz89rda	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	7/10 + 8/10	1 1/2	FRACTION_ADDITION	EASY	{mixed-numbers-in-answer,results-in-mixed-number}
cmk37cpt7008au23vgpu2mivj	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	8/14 + 9/14	1 3/14	FRACTION_ADDITION	EASY	{mixed-numbers-in-answer,results-in-mixed-number}
cmk37cpt7008bu23ve4tmgl2l	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	11/16 + 13/16	1 1/2	FRACTION_ADDITION	EASY	{mixed-numbers-in-answer,results-in-mixed-number}
cmk37cpta008cu23vo3osr03b	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	2/9 + 4/9	2/3	FRACTION_ADDITION	EASY	{single-digit-denominators}
cmk37cpta008du23vj61dphjj	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	3/14 + 5/14	4/7	FRACTION_ADDITION	EASY	{}
cmk37cpta008eu23vdkx1qe71	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	1/7 + 4/7	5/7	FRACTION_ADDITION	EASY	{single-digit-denominators}
cmk37cpta008fu23v8twn6hgy	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	5/16 + 7/16	3/4	FRACTION_ADDITION	EASY	{}
cmk37cpta008gu23vxmklvxz9	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	3/13 + 6/13	9/13	FRACTION_ADDITION	EASY	{}
cmk37cpta008hu23v2bdv6wcc	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	2/11 + 5/11	7/11	FRACTION_ADDITION	EASY	{}
cmk37cpta008iu23vumo9y4ut	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	4/15 + 8/15	4/5	FRACTION_ADDITION	EASY	{}
cmk37cpta008ju23vb1qem2rh	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	1/6 + 3/6	2/3	FRACTION_ADDITION	EASY	{single-digit-denominators}
cmk37cpta008ku23v4gp7wqnz	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	6/20 + 9/20	3/4	FRACTION_ADDITION	EASY	{}
cmk37cpta008lu23v5q7tcwag	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	3/12 + 7/12	5/6	FRACTION_ADDITION	EASY	{}
cmk37cpta008mu23vnnwwzde0	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	1 2/8 + 3/8	1 5/8	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpta008nu23vfhy865t6	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	2 4/15 + 6/15	2 2/3	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpta008ou23vlb9ntbs3	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	1 5/14 + 8/14	1 13/14	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpta008pu23vovvbjsjf	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	3 3/10 + 6/10	3 9/10	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpta008qu23vqjxn8bio	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	2 6/11 + 7/11	3 2/11	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpta008ru23vweg7k8vj	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	2 3/11 + 5/11	2 8/11	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpta008su23vopsfctj8	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	4 2/6 + 3/6	4 5/6	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpta008tu23vvvt3cg6n	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	3 5/15 + 8/15	3 13/15	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpta008uu23vxu2nw5i4	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	2 7/12 + 9/12	3 1/3	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpta008vu23vg5cw1krn	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	5 4/8 + 6/8	6 1/4	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpta008wu23val8xin31	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	1 6/10 + 2 7/10	4 3/10	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpta008xu23vqmr3m8zi	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	3 5/9 + 1 7/9	5 1/3	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpta008yu23vm2ggitgy	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	2 8/14 + 2 9/14	5 3/14	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpta0090u23vnenjnm8g	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	3 7/13 + 1 8/13	5 2/13	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpta0091u23v6264ebwi	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	5/7 + 4/7	1 2/7	FRACTION_ADDITION	EASY	{mixed-numbers-in-answer,results-in-mixed-number,single-digit-denominators}
cmk37cpta0092u23vu6sy1jta	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	7/18 + 11/18	1	FRACTION_ADDITION	EASY	{}
cmk37cpta0093u23vgmttvlpz	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	8/21 + 10/21	6/7	FRACTION_ADDITION	EASY	{}
cmk37cpta0094u23v4s3b62p9	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	6/19 + 9/19	15/19	FRACTION_ADDITION	EASY	{}
cmk37cpta0095u23vree4mc4e	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	2 9/12 + 3 8/12	6 5/12	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cptc0096u23vd8c26d02	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	2/9 + 4/9	2/3	FRACTION_ADDITION	EASY	{single-digit-denominators}
cmk37cptc0097u23vlx1ya21k	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	3/8 + 2/8	5/8	FRACTION_ADDITION	EASY	{single-digit-denominators}
cmk37cptc0098u23vj6cx80jz	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	1/6 + 4/6	5/6	FRACTION_ADDITION	EASY	{single-digit-denominators}
cmk37cptc0099u23v85wpd7un	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	5/10 + 3/10	4/5	FRACTION_ADDITION	EASY	{}
cmk37cptc009au23vcqu77es0	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	3/14 + 5/14	4/7	FRACTION_ADDITION	EASY	{}
cmk37cptc009bu23vucbnbrnv	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	2/11 + 6/11	8/11	FRACTION_ADDITION	EASY	{}
cmk37cptc009cu23v5lywxkrl	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	4/15 + 7/15	11/15	FRACTION_ADDITION	EASY	{}
cmk37cptc009du23vmhbi36w5	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	1/4 + 2/4	3/4	FRACTION_ADDITION	EASY	{single-digit-denominators}
cmk37cptc009eu23vfx86vupe	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	6/16 + 5/16	11/16	FRACTION_ADDITION	EASY	{}
cmk37cptc009fu23vpcfsdd3m	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	3/12 + 7/12	5/6	FRACTION_ADDITION	EASY	{}
cmk37cptc009gu23v5gohuq59	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	1 3/7 + 2/7	1 5/7	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cptc009hu23vwek3zswx	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	2 4/9 + 3/9	2 7/9	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cptc009iu23v5fiqr16a	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	1 2/5 + 1/5	1 3/5	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cptc009ju23vb30vi0lc	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	3 5/11 + 4/11	3 9/11	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cptc009ku23vfi6gxx2x	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	2 7/16 + 6/16	2 13/16	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cptd009lu23vzzlnptll	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	2 3/7 + 1/7	2 4/7	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cptd009mu23v7daact26	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	1 5/12 + 6/12	1 11/12	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cptd009nu23v83mwjirk	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	3 2/9 + 5/9	3 7/9	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cptd009ou23v6jj6gl26	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	2 4/15 + 8/15	2 4/5	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cptd009pu23vius11tw8	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	1 7/10 + 2/10	1 9/10	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cptd009qu23v01nh1q6q	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	2 3/8 + 1 3/8	3 3/4	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cptd009ru23vzhi2azl2	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	1 5/14 + 2 6/14	3 11/14	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cptd009su23v59jsjdly	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	3 4/11 + 1 5/11	4 9/11	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cptd009tu23vp5fvzxuz	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	2 6/9 + 1 8/9	4 5/9	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cptd009uu23vgadsf6ls	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	1 8/13 + 2 9/13	4 4/13	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cptd009vu23v6bevoxj5	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	4/8 + 6/8	1 1/4	FRACTION_ADDITION	EASY	{mixed-numbers-in-answer,results-in-mixed-number,single-digit-denominators}
cmk37cptd009wu23v0v3ouw8z	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	7/12 + 8/12	1 1/4	FRACTION_ADDITION	EASY	{mixed-numbers-in-answer,results-in-mixed-number}
cmk37cptd009xu23vk1vv1uy2	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	9/15 + 11/15	1 1/3	FRACTION_ADDITION	EASY	{mixed-numbers-in-answer,results-in-mixed-number}
cmk37cptd009zu23v6j28rche	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	6/10 + 7/10	1 3/10	FRACTION_ADDITION	EASY	{mixed-numbers-in-answer,results-in-mixed-number}
cmk37cptf00a0u23vizcsa8u2	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	1/2 + 1/4	3/4	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptf00a1u23vqa53oo0m	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	1/3 + 1/6	1/2	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptf00a2u23vb83m45ya	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	1/4 + 1/8	3/8	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptf00a3u23v52462lav	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	2/3 + 1/6	5/6	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptf00a4u23v8i3nv6ue	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	1/5 + 1/10	3/10	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptf00a5u23v4v8gopg3	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	1/2 + 1/3	5/6	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptf00a6u23vh6z9q3vq	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	3/4 + 1/8	7/8	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptf00a7u23v6yof07xb	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	2/5 + 1/10	1/2	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptf00a8u23vyjydssdf	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	1/3 + 1/9	4/9	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptf00a9u23vjezt55io	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	3/5 + 1/10	7/10	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptf00aau23vlvtfdmsc	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	1 1/4 + 1/2	1 3/4	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptf00abu23v23maplok	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	2 1/3 + 1/6	2 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptf00acu23vgi29xmdf	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	1 1/2 + 1/4	1 3/4	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptf00adu23vroeu0yb7	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	2 2/5 + 1/10	2 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,unlike-denominators}
cmk37cptf00aeu23v51zo0es7	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	3 1/3 + 1/3	3 2/3	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cptf00afu23vevvwud2i	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	1 1/3 + 1/6	1 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptf00agu23vffalyt6b	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	2 1/4 + 1/8	2 3/8	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptf00ahu23vdza07kpd	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	1 1/2 + 2/5	1 9/10	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptf00aiu23vw0pw5bfh	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	3 1/3 + 1/2	3 5/6	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptf00aju23vrfs3anqk	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	2 2/5 + 3/10	2 7/10	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,unlike-denominators}
cmk37cptf00aku23vixl3vu4n	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	3/4 + 1/8	7/8	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptf00alu23vslrgwkud	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	5/6 + 1/12	11/12	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptf00amu23vmn4fl66m	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	3/5 + 1/10	7/10	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptf00anu23v85fkdk1d	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	5/8 + 1/4	7/8	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptf00aou23v80140qq2	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	7/12 + 1/6	3/4	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptf00apu23vd2jvcc57	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	2/3 + 1/4	11/12	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptf00aqu23ve015s1s1	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	3/8 + 1/2	7/8	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptf00aru23vluh3fqx7	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	5/9 + 1/3	8/9	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptf00asu23v745f1pu8	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	7/10 + 1/5	9/10	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptf00atu23vg3vier52	2026-01-06 23:10:06.004	2026-01-06 23:10:06.004	4/5 + 1/2	1 3/10	FRACTION_ADDITION	MEDIUM	{mixed-numbers-in-answer,results-in-mixed-number,single-digit-denominators,unlike-denominators}
cmk37cptt00dgu23v4nnrp4wq	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	21/35	3/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpti00avu23vao9496lk	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	1/4 + 1/6	5/12	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cpti00awu23vt8s7mxep	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	2/5 + 1/2	9/10	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cpti00axu23vc20a01sr	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	1/6 + 1/4	5/12	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cpti00ayu23vymy91yrl	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	3/8 + 1/4	5/8	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cpti00azu23vb0zuthu7	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	2/5 + 1/3	11/15	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cpti00b0u23vtkdi89p8	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	1/3 + 1/4	7/12	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cpti00b1u23vfwx8xzae	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	3/10 + 1/2	4/5	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cpti00b2u23vkf2z4yge	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	1/6 + 2/3	5/6	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cpti00b3u23vq9dsv1l3	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	1/8 + 1/4	3/8	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cpti00b4u23v2xvdpq80	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	1 2/3 + 1/4	1 11/12	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cpti00b5u23vxhb37f4f	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	2 1/6 + 1/3	2 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cpti00b6u23vwymml9rg	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	1 1/5 + 1/2	1 7/10	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cpti00b7u23vxgqfxxbw	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	3 1/4 + 1/6	3 5/12	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cpti00b8u23vb916fnto	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	2 3/8 + 1/4	2 5/8	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cpti00b9u23vpaofp5z6	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	2 1/6 + 1/2	2 2/3	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cpti00bau23v05ms38es	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	3 3/8 + 1/4	3 5/8	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cpti00bbu23vk9337rgw	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	1 1/5 + 3/10	1 7/10	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,unlike-denominators}
cmk37cpti00bcu23v9y7fwcgt	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	2 2/3 + 1/6	2 5/6	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cpti00bdu23v735toidl	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	4 1/4 + 1/8	4 3/8	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cpti00beu23vu7tonnk5	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	1/2 + 2/5	9/10	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cpti00bfu23v4818zv8e	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	3/4 + 1/6	11/12	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cpti00bgu23vap08wvyv	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	2/5 + 3/8	31/40	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cpti00bhu23vad39y09g	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	1/3 + 5/12	3/4	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptj00biu23vl1r0rq50	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	7/10 + 1/5	9/10	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptj00bju23vmluzh9fy	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	4/5 + 1/3	1 2/15	FRACTION_ADDITION	MEDIUM	{mixed-numbers-in-answer,results-in-mixed-number,single-digit-denominators,unlike-denominators}
cmk37cptj00bku23vjy9qwccg	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	5/6 + 1/4	1 1/12	FRACTION_ADDITION	MEDIUM	{mixed-numbers-in-answer,results-in-mixed-number,single-digit-denominators,unlike-denominators}
cmk37cptj00blu23v6vc7nmkj	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	3/8 + 1/3	17/24	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptj00bmu23v6g00ukhi	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	5/12 + 1/4	2/3	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptj00bnu23vmul0eko4	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	9/10 + 1/5	1 1/10	FRACTION_ADDITION	MEDIUM	{mixed-numbers-in-answer,results-in-mixed-number,unlike-denominators}
cmk37cptm00bou23vdwdg6gis	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	1/5 + 1/2	7/10	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptt00dhu23vrt3onepw	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	8/12	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptm00bqu23vb54r53re	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	1/6 + 1/3	1/2	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00bru23vejhb0gjq	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	2/3 + 1/5	13/15	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00bsu23v15g24xap	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	3/8 + 1/6	13/24	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00btu23vzs7c9tcd	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	1/4 + 1/5	9/20	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00buu23vstnlw3l6	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	2/5 + 1/4	13/20	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00bvu23vph2ileul	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	1/2 + 1/6	2/3	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00bwu23vp1neyhzl	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	4/9 + 1/3	7/9	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00bxu23v09xvl1vs	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	1/3 + 1/8	11/24	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00byu23vgg08ntun	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	1 1/4 + 1/3	1 7/12	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptm00bzu23vtnf3k0c7	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	2 2/5 + 1/4	2 13/20	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptm00c0u23vc09d05n5	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	1 1/6 + 1/2	1 2/3	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptm00c1u23vnp2phykf	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	2 3/8 + 1/3	2 17/24	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptm00c2u23v9x4hicsn	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	3 1/5 + 1/4	3 9/20	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptm00c3u23vdgqyldh0	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	3 1/4 + 1/3	3 7/12	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptm00c4u23vmjrt0j9d	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	2 1/8 + 3/4	2 7/8	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptm00c5u23v2cuhpunk	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	4 1/6 + 1/4	4 5/12	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptm00c6u23vj75hnsj3	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	1 3/5 + 2/3	2 4/15	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptm00c7u23v6opnq5az	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	3 1/3 + 3/8	3 17/24	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptm00c8u23v2w1pl5k0	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	5/8 + 1/6	19/24	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00c9u23vqdyig51n	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	7/12 + 1/3	11/12	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptm00cau23vn889nuwn	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	3/10 + 1/4	11/20	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptm00cbu23v2emt6gbd	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	5/6 + 1/8	23/24	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00ccu23ve3ssig6p	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	2/5 + 1/6	17/30	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00cdu23vgc1yxnkb	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	7/10 + 1/4	19/20	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptm00ceu23v7nt4ndeb	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	3/5 + 1/8	29/40	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00cfu23v2ohblngi	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	5/12 + 1/3	3/4	FRACTION_ADDITION	MEDIUM	{unlike-denominators}
cmk37cptm00cgu23vmtmpeo1o	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	4/5 + 1/6	29/30	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00chu23v05a3qvrg	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	7/8 + 1/3	1 5/24	FRACTION_ADDITION	MEDIUM	{mixed-numbers-in-answer,results-in-mixed-number,single-digit-denominators,unlike-denominators}
cmk37cptq00ciu23vm9kzl9zh	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	1/3 + 1/4	7/12	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00cju23v4a1dckuo	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	2/5 + 1/3	11/15	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptt00diu23v0q2iua6x	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	16/28	4/7	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptq00clu23vgpq49qku	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	3/4 + 1/6	11/12	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00cmu23vskqt6sgt	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	1/4 + 2/3	11/12	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00cnu23vgthlomad	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	3/5 + 1/4	17/20	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00cou23v5hfebtgl	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	1/3 + 1/6	1/2	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00cpu23vwnlmelfk	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	2/7 + 1/2	11/14	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00cqu23vc5ltykro	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	3/8 + 1/4	5/8	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00cru23vbvmp9j7k	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	1/5 + 2/7	17/35	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00csu23v941f2jpj	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	1 1/2 + 1/3	1 5/6	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptq00ctu23vkdy9s59m	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	2 1/4 + 1/5	2 9/20	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptq00cuu23vx2nq6dkt	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	1 2/3 + 1/4	1 11/12	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptq00cvu23v0bfgpw5y	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	3 1/5 + 1/3	3 8/15	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptq00cwu23vdu24hgun	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	2 3/4 + 1/6	2 11/12	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptq00cxu23v105s03v1	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	2 1/3 + 1/5	2 8/15	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptq00cyu23veaaqgz7c	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	1 3/4 + 2/5	2 3/20	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptq00czu23vx4qja65a	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	3 2/5 + 1/6	3 17/30	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptq00d0u23vzl1c1ye1	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	2 1/6 + 3/4	2 11/12	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptq00d1u23vtsm02i04	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	4 1/8 + 1/3	4 11/24	FRACTION_ADDITION	HARD	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators,unlike-denominators}
cmk37cptq00d2u23vjp7pbxy3	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	3/7 + 1/2	13/14	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00d3u23vvfdwykwh	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	5/9 + 1/3	8/9	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00d4u23v151scp9a	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	2/5 + 3/8	31/40	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00d5u23vlnjaor1e	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	4/7 + 1/3	19/21	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00d6u23vvzl01ezy	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	1/6 + 3/4	11/12	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00d7u23v1n510im3	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	5/8 + 1/5	33/40	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00d8u23vl0v7pbmr	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	2/3 + 1/7	17/21	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00d9u23v11epr3as	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	3/5 + 2/9	37/45	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptq00dau23vqqx1bywv	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	5/6 + 1/4	1 1/12	FRACTION_ADDITION	MEDIUM	{mixed-numbers-in-answer,results-in-mixed-number,single-digit-denominators,unlike-denominators}
cmk37cptq00dbu23vqtt75nvc	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	4/9 + 1/2	17/18	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cpts00dcu23vz4525g9q	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	6/9	2/3	FRACTION_REDUCTION	EASY	{single-digit-denominators,requires-reduction}
cmk37cpts00ddu23vt731v3wt	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	12/16	3/4	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpts00deu23vyl6dndsp	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	15/20	3/4	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpts00dfu23vu6rmu6ea	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	10/25	2/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptt00dku23vdmuy1b2n	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	12/20	3/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptt00dlu23vpor7hkp9	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	25/35	5/7	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptt00dmu23vpuziy1xj	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	9/15	3/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptt00dnu23vhmsika0y	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	14/21	2/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptt00dou23v5sz0aw9k	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	20/30	2/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptt00dpu23vgizac1pr	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	6/14	3/7	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptt00dqu23vzfna2991	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	10/12	5/6	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptt00dru23vu9ekso6e	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	22/33	2/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptt00dsu23vkgwdp12k	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	18/27	2/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptt00dtu23vjm2ceeay	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	30/35	6/7	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptt00duu23vy81n20sd	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	14/49	2/7	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptt00dvu23vj943ogp2	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	24/32	3/4	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptt00dwu23viefbfe3g	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	15/45	1/3	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptt00dxu23vt8ep6yfn	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	27/45	3/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptt00dyu23v5ous0pya	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	20/24	5/6	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptt00dzu23vgslttksc	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	35/42	5/6	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptt00e0u23vvbaidw3q	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	16/20	4/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptt00e1u23v0ku8s8tj	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	28/42	2/3	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptt00e2u23vbflwqs5n	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	30/40	3/4	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptt00e3u23vnghnpwn3	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	12/28	3/7	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptt00e4u23varwazlb9	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	21/49	3/7	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptt00e5u23vxpn6l3fr	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	24/36	2/3	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptv00e6u23vsng1zdsk	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	4/6	2/3	FRACTION_REDUCTION	EASY	{single-digit-denominators,requires-reduction}
cmk37cptv00e7u23v1zrpjk31	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	10/15	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptv00e8u23vytpl06tl	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	12/18	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptv00e9u23vxl5bmxxk	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	8/14	4/7	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptv00eau23vdrwixj4q	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	15/25	3/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptv00ebu23vorw4xu04	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	9/21	3/7	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptv00ecu23vkoucy7n6	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	14/22	7/11	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptv00edu23v8wagme38	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	16/20	4/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptv00eeu23v1y4mbvih	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	10/18	5/9	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptv00efu23vqbbfstr7	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	12/16	3/4	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptv00egu23vfqre6a3n	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	6/10	3/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptv00ehu23vwk71arsd	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	18/27	2/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptv00eiu23vxczz9f0d	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	20/25	4/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptv00eju23vscj92cr1	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	8/24	1/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptv00eku23vvp6i4izd	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	14/18	7/9	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptv00elu23vlyyo1mfv	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	18/24	3/4	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptv00emu23v4m8e1tki	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	16/40	2/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptv00enu23vqqmui8n7	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	21/28	3/4	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptv00epu23v5j1frfeh	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	18/30	3/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptv00equ23v4tgzqsll	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	20/32	5/8	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptv00eru23vw3trqt72	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	24/40	3/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptv00esu23vfvpuvfmf	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	27/36	3/4	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptv00etu23v20ut0bnf	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	15/36	5/12	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptv00euu23vk5xfqc9v	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	28/35	4/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptv00evu23vwac1g4a1	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	22/44	1/2	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptv00ewu23vqim6h398	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	30/45	2/3	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptv00exu23vcik2znjk	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	16/36	4/9	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptv00eyu23v58onjfw5	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	35/45	7/9	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptv00ezu23vlqukxr76	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	24/42	4/7	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptx00f0u23vc1jlhq1r	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	8/12	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptx00f1u23vgfwgg0ek	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	15/25	3/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptx00f2u23vl9irdrwb	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	12/18	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptx00f3u23vqe44arnn	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	14/28	1/2	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptx00f4u23v40cu6n3k	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	18/24	3/4	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptx00f5u23v8ledpxzw	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	10/15	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptx00f6u23vx79rhagv	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	24/30	4/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptx00f7u23vjnepe9kc	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	16/24	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptx00f8u23vfn8q3w7w	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	20/28	5/7	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptx00f9u23vi3zerlyx	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	9/21	3/7	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptx00fau23vjyow3ga1	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	12/15	4/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptx00fbu23v8nxylbku	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	18/30	3/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptx00fcu23vn20h9xcp	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	6/18	1/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptx00fdu23vu0l4enf4	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	22/44	1/2	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptx00feu23vqhyitkto	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	10/18	5/9	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptx00ffu23v1hxiqaku	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	28/35	4/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptx00fgu23v9rp70a0b	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	20/32	5/8	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptx00fhu23vje3s67b0	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	36/48	3/4	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptx00fiu23v92qukj4u	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	15/35	3/7	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptx00fju23v6l35546h	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	27/36	3/4	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cptx00fku23v7rrie6ip	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	14/42	1/3	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptx00flu23v7rowqw0z	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	25/40	5/8	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptx00fmu23vqc0bherb	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	32/48	2/3	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptx00fnu23vkxnlc7tb	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	18/30	3/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptx00fou23vr8clw82r	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	24/40	3/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptx00fpu23vhbw6be8t	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	21/28	3/4	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptx00fqu23vyabc9e9a	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	16/36	4/9	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptx00fru23vbbeht3o2	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	35/45	7/9	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cptx00fsu23vhl1r0l5y	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	12/32	3/8	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu000fuu23v1n2xmnc4	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	8/14	4/7	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu000fvu23vvkdz2q0h	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	10/14	5/7	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu000fwu23vaczfrzj1	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	12/18	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu000fxu23v3gc203uy	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	9/18	1/2	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu000fyu23vjmu0unzd	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	14/21	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu000fzu23vt8jkbg0p	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	16/24	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu000g0u23vsdhsyqjb	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	12/28	3/7	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu000g1u23vkvsg6l8y	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	15/18	5/6	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu000g2u23vce5j9u8i	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	20/25	4/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu000g3u23vnd70fzua	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	18/24	3/4	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu000g4u23vec5i0hbl	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	10/16	5/8	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu000g5u23vvs0voxwm	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	14/28	1/2	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu000g6u23vdm5vvpew	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	12/30	2/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu000g7u23vil8zuvd2	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	20/28	5/7	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu000g8u23voxpsz6or	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	15/20	3/4	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu000g9u23vkl9qsuit	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	26/39	2/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu000gau23vvpefm6p7	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	20/32	5/8	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu000gbu23vdyc0yrrf	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	28/35	4/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu000gcu23v13qv44hy	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	32/48	2/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu000gdu23v0to887q7	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	15/25	3/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu000geu23vlcf79927	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	18/30	3/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu100gfu23venb1he57	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	24/40	3/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu100ggu23vvad1gpi5	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	21/28	3/4	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu100ghu23v0sw3w26j	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	16/36	4/9	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu100giu23voqjkfc24	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	12/32	3/8	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu100gju23vow7mte78	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	9/27	1/3	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu100gku23v71xbkjn7	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	25/35	5/7	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu100glu23vbpbdgqc3	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	18/36	1/2	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu100gmu23v5tydxji9	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	14/35	2/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu100gnu23v5dllsy6g	2026-01-06 23:10:06.025	2026-01-06 23:10:06.025	24/30	4/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu300gou23vvyjyfpmc	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	6/8	3/4	FRACTION_REDUCTION	EASY	{single-digit-denominators,requires-reduction}
cmk37cpu300gpu23v2r1t5v25	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	9/12	3/4	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu300gqu23v7x6ohl95	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	10/14	5/7	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu300gru23vaa9wyi0i	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	12/18	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu300gsu23v92veszu9	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	16/32	1/2	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu300gtu23vb9w9qw8f	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	14/35	2/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu300guu23vy11ijwjh	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	18/30	3/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu300gvu23vhad24zl8	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	24/28	6/7	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu300gwu23vx6lnrw66	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	20/24	5/6	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu300gxu23vkbrt4fpp	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	15/25	3/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu300gzu23vvdo56r2r	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	12/16	3/4	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu300h0u23v6x5ad7d9	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	20/36	5/9	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu300h1u23vzil4z9gt	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	10/15	2/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu300h2u23vg74vtp1w	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	18/24	3/4	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu300h3u23v20e3p1m5	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	27/36	3/4	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu300h4u23v90gwp7cr	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	15/40	3/8	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu300h5u23vtj622kh2	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	21/49	3/7	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu300h6u23vpc90h8n9	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	8/24	1/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu300h7u23v89kqee6e	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	20/45	4/9	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu300h8u23v3ea43vp3	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	16/40	2/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu300h9u23vx9vpoz0y	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	9/21	3/7	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu300hau23vzeciayj7	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	25/50	1/2	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu300hbu23vyzgev3o3	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	14/42	1/3	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu300hcu23v22xh01xy	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	32/40	4/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu300hdu23vul8w2f85	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	28/49	4/7	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu300heu23vjykia6dy	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	18/45	2/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu300hfu23v81qsyevo	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	24/32	3/4	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu300hgu23vguobqslu	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	15/35	3/7	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu400hhu23vexv5s47g	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	12/36	1/3	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu600hiu23v282vhrvt	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	4/6	2/3	FRACTION_REDUCTION	EASY	{single-digit-denominators,requires-reduction}
cmk37cpu600hju23vtg3qyxe8	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	8/10	4/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu600hku23vnzv5jmo3	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	15/18	5/6	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu600hlu23v8czj4tmg	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	10/16	5/8	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu600hmu23v7zsfww99	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	18/27	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu600hnu23vciitn24j	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	12/15	4/5	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu600hou23vr71zv198	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	21/28	3/4	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu600hpu23v3ygsia5f	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	9/24	3/8	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu600hqu23v24jbrks3	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	16/24	2/3	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu600hru23vdqbo125q	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	6/12	1/2	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cpu600hsu23vroug9xrl	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	14/35	2/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu600htu23vw6ydcaxl	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	20/30	2/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu600huu23v4g1oh7dj	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	8/20	2/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu600hvu23vbg6qy2uw	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	15/35	3/7	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu600hwu23v3hiv5mgo	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	24/32	3/4	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu600hxu23vv92fhtid	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	30/45	2/3	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu600hyu23v66kf7e50	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	12/20	3/5	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu600hzu23vc67dwpgq	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	16/28	4/7	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu600i0u23vnxcdai8z	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	25/40	5/8	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu600i1u23ve0c5y6tv	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	14/49	2/7	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpu600i2u23vswnwly3s	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	20/32	5/8	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu800idu23vpiiu7gci	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	7/10 - 3/10	2/5	FRACTION_SUBTRACTION	EASY	{}
cmk37cpu800ieu23vg0602689	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	5/6 - 1/6	2/3	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpu800ifu23vdqz644lh	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	9/12 - 5/12	1/3	FRACTION_SUBTRACTION	EASY	{}
cmk37cpu800igu23vmvmqoitv	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	6/7 - 2/7	4/7	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpu800ihu23v20e11xq8	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	8/9 - 5/9	1/3	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpu800iiu23vwapu7il8	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	11/14 - 3/14	4/7	FRACTION_SUBTRACTION	EASY	{}
cmk37cpu800iju23vqd1a5v7r	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	7/15 - 2/15	1/3	FRACTION_SUBTRACTION	EASY	{}
cmk37cpu800iku23vc5dnb2s4	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	10/16 - 6/16	1/4	FRACTION_SUBTRACTION	EASY	{}
cmk37cpu800ilu23v4em4cwgs	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	9/11 - 4/11	5/11	FRACTION_SUBTRACTION	EASY	{}
cmk37cpu800imu23v1xuk3nll	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	1 4/6 - 2/6	1 1/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpu800inu23vzd8f8y3x	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	2 3/8 - 5/8	1 3/4	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpu800iou23v1cqkjn4o	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	1 6/10 - 4/10	1 1/5	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpu800ipu23vbsoflkud	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	3 5/7 - 3/7	3 2/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpu800iqu23vrcdzedq0	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	2 7/12 - 9/12	1 5/6	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpu800iru23vtbsm6l3n	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	2 5/9 - 2/9	2 1/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpu800isu23vf0gnk9oo	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	4 3/7 - 2/7	4 1/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpu800itu23vwajovam5	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	3 7/12 - 5/12	3 1/6	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpu800iuu23vncdatbvq	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	2 4/15 - 8/15	1 11/15	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpu800ivu23vuk6vucv5	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	5 2/6 - 4/6	4 2/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpu800iwu23v61u7t9oy	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	1 5/8 - 1 3/8	1/4	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question,single-digit-denominators}
cmk37cpu800ixu23vocrml5go	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	3 7/10 - 2 4/10	1 3/10	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpu800iyu23vqgpq9yy8	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	2 5/9 - 1 2/9	1 1/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpu800izu23vyk4s7kw2	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	4 8/12 - 2 3/12	2 5/12	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpu800j0u23v4o8aw6na	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	3 4/7 - 1 6/7	1 5/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpu600i3u23v02wwq7cd	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	18/42	3/7	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu600i4u23vmxolqbow	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	15/30	1/2	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu600i5u23vbdvxm1pr	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	24/36	2/3	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu600i6u23vpsg72y9p	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	32/48	2/3	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu600i7u23vhbr4al4b	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	10/35	2/7	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu600i8u23vffla972o	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	27/36	3/4	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu600i9u23v46n6qocd	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	12/32	3/8	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu600iau23vsp5mt8jt	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	18/48	3/8	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu600ibu23vp08d8za1	2026-01-06 23:10:06.03	2026-01-06 23:10:06.03	21/35	3/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu800j2u23vcu9o96if	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	12/14 - 5/14	1/2	FRACTION_SUBTRACTION	EASY	{}
cmk37cpu800j3u23v96l62nm3	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	9/10 - 3/10	3/5	FRACTION_SUBTRACTION	EASY	{}
cmk37cpu800j4u23vn6qf4a84	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	10/12 - 4/12	1/2	FRACTION_SUBTRACTION	EASY	{}
cmk37cpu800j5u23vney6rg43	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	2 8/15 - 1 11/15	4/5	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question}
cmk37cpub00j6u23vx9j1uzyc	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	7/9 - 3/9	4/9	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpub00j7u23vcb7bink3	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	8/12 - 3/12	5/12	FRACTION_SUBTRACTION	EASY	{}
cmk37cpub00j8u23v8kx2xeqo	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	9/14 - 2/14	1/2	FRACTION_SUBTRACTION	EASY	{}
cmk37cpub00j9u23vqff125cq	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	11/15 - 4/15	7/15	FRACTION_SUBTRACTION	EASY	{}
cmk37cpub00jau23vv7pgwjuj	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	5/7 - 1/7	4/7	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpub00jbu23vg0lfluzi	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	10/13 - 3/13	7/13	FRACTION_SUBTRACTION	EASY	{}
cmk37cpub00jcu23v4v16m9w0	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	13/16 - 5/16	1/2	FRACTION_SUBTRACTION	EASY	{}
cmk37cpub00jdu23vx6ibo7i7	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	6/11 - 2/11	4/11	FRACTION_SUBTRACTION	EASY	{}
cmk37cpub00jeu23vg0z3qo92	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	15/18 - 7/18	4/9	FRACTION_SUBTRACTION	EASY	{}
cmk37cpub00jfu23vs7df34px	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	8/10 - 3/10	1/2	FRACTION_SUBTRACTION	EASY	{}
cmk37cpub00jgu23v67r5rem1	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	2 5/7 - 3/7	2 2/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpub00jhu23vpu3haqff	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	3 4/9 - 6/9	2 7/9	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpub00jiu23vo97srgc9	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	1 7/12 - 5/12	1 1/6	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpub00jju23vw2wduxuj	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	4 3/8 - 5/8	3 3/4	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpub00jku23vp3xksolg	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	2 8/15 - 11/15	1 13/15	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpub00jlu23vyixxw1aq	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	3 7/10 - 5/10	3 1/5	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpub00jmu23vh3sqx7ph	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	5 4/8 - 3/8	5 1/8	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpub00jnu23vudu2i8ws	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	4 5/11 - 7/11	3 9/11	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpub00jou23vyiryj0r6	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	3 3/6 - 5/6	2 2/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpub00jpu23vp4osuads	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	6 2/9 - 5/9	5 2/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpub00jqu23v5a6qpjrh	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	2 6/8 - 1 5/8	1 1/8	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpub00jru23vclg2ib4m	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	4 8/12 - 3 5/12	1 1/4	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpub00jsu23vwza2p9qn	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	3 9/14 - 2 3/14	1 3/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpub00jtu23v2dhavup3	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	5 7/10 - 3 4/10	2 3/10	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpub00juu23v2fojtx7e	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	4 5/12 - 2 8/12	1 3/4	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpub00jvu23vprhermia	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	8/15 - 3/15	1/3	FRACTION_SUBTRACTION	EASY	{}
cmk37cpub00jwu23vf8qtm3dg	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	11/16 - 7/16	1/4	FRACTION_SUBTRACTION	EASY	{}
cmk37cpub00jxu23vyoycuiqo	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	14/20 - 6/20	2/5	FRACTION_SUBTRACTION	EASY	{}
cmk37cpub00jyu23vn4ymraxi	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	9/13 - 4/13	5/13	FRACTION_SUBTRACTION	EASY	{}
cmk37cpug00kxu23vfujstl3i	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	6/13 - 2/13	4/13	FRACTION_SUBTRACTION	EASY	{}
cmk37cpud00k0u23vfobmnfhp	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	7/9 - 3/9	4/9	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpud00k1u23vgok2htux	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	8/10 - 5/10	3/10	FRACTION_SUBTRACTION	EASY	{}
cmk37cpud00k2u23vi04a7dik	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	4/7 - 1/7	3/7	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpud00k3u23v46xx6i05	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	11/12 - 7/12	1/3	FRACTION_SUBTRACTION	EASY	{}
cmk37cpud00k4u23vhljqdoug	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	5/6 - 2/6	1/2	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpud00k5u23vdw73yw9d	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	9/14 - 4/14	5/14	FRACTION_SUBTRACTION	EASY	{}
cmk37cpud00k6u23v1j4hlghs	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	10/15 - 3/15	7/15	FRACTION_SUBTRACTION	EASY	{}
cmk37cpud00k7u23vxm3opv7w	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	6/8 - 2/8	1/2	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpud00k8u23ve83bxypo	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	13/16 - 8/16	5/16	FRACTION_SUBTRACTION	EASY	{}
cmk37cpud00k9u23vh5geo7io	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	8/11 - 3/11	5/11	FRACTION_SUBTRACTION	EASY	{}
cmk37cpud00kau23vdt9ttsh3	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	1 5/7 - 3/7	1 2/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpud00kbu23vfpfmevnx	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	2 2/9 - 6/9	1 2/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpud00kcu23vf7o83zta	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	1 7/15 - 8/15	14/15	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question}
cmk37cpud00kdu23v35zeghok	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	3 4/10 - 6/10	2 4/5	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpud00keu23vorgoc5hh	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	2 3/11 - 5/11	1 9/11	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpud00kfu23vp33bjl4w	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	3 4/8 - 1/8	3 3/8	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpud00kgu23vnd75mc8d	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	2 5/11 - 3/11	2 2/11	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpud00khu23vr59ojf3z	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	4 6/15 - 4/15	4 2/15	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpud00kiu23v157bxpo0	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	3 2/9 - 7/9	2 4/9	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpud00kju23v4yjnio8r	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	5 3/14 - 8/14	4 9/14	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpud00kku23vjsvxzw2w	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	2 4/7 - 1 2/7	1 2/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpud00klu23vpziclyo6	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	4 5/12 - 2 8/12	1 9/12	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpud00kmu23vfnvb0ocb	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	3 6/13 - 1 4/13	2 2/13	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpud00knu23vlez39hsh	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	5 3/10 - 2 7/10	2 3/5	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpud00kou23v1ve0q95u	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	2 1/6 - 1 5/6	1/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question,single-digit-denominators}
cmk37cpud00kpu23ve5rd06kz	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	9/12 - 5/12	1/3	FRACTION_SUBTRACTION	EASY	{}
cmk37cpud00kqu23v5inym0xe	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	14/16 - 6/16	1/2	FRACTION_SUBTRACTION	EASY	{}
cmk37cpud00kru23vignfezg2	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	11/14 - 4/14	1/2	FRACTION_SUBTRACTION	EASY	{}
cmk37cpud00ksu23vfka5wc36	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	15/18 - 8/18	7/18	FRACTION_SUBTRACTION	EASY	{}
cmk37cpud00ktu23vusonbm9w	2026-01-06 23:10:06.037	2026-01-06 23:10:06.037	3 2/8 - 1 7/8	1 3/8	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpug00kuu23v87ghq39r	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	7/9 - 2/9	5/9	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpug00kvu23v3ef04tau	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	8/11 - 3/11	5/11	FRACTION_SUBTRACTION	EASY	{}
cmk37cpug00kwu23v25vlvc4n	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	9/14 - 4/14	5/14	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuh00lfu23vi42fd0u4	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	4 1/7 - 2 3/7	1 5/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpug00l5u23vgtww2juh	2026-01-06 23:10:06.041	2026-03-14 17:56:33.748	2 6/11 - 4/11	2 2/11	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpug00l7u23vimr5rurq	2026-01-06 23:10:06.041	2026-03-14 17:58:15.607	3 4/10 - 6/10	2 4/5	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpug00l8u23v87d38khy	2026-01-06 23:10:06.041	2026-03-14 17:58:15.61	2 3/7 - 5/7	1 5/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpug00leu23vq6pgnh2t	2026-01-06 23:10:06.041	2026-03-14 17:58:15.611	2 2/9 - 1 5/9	2/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question,single-digit-denominators}
cmk37cpuh00lnu23vaziz42vl	2026-01-06 23:10:06.041	2026-03-14 17:58:15.614	3 1/8 - 2 5/8	1/2	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question,single-digit-denominators}
cmk37cpug00kzu23v29e4qdsw	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	10/15 - 4/15	6/15 = 2/5	FRACTION_SUBTRACTION	EASY	{}
cmk37cpug00l0u23vdm65j0d9	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	13/18 - 6/18	7/18	FRACTION_SUBTRACTION	EASY	{}
cmk37cpug00l1u23vk8fzb09u	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	8/17 - 3/17	5/17	FRACTION_SUBTRACTION	EASY	{}
cmk37cpug00l2u23vqfygzrgb	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	12/20 - 5/20	7/20	FRACTION_SUBTRACTION	EASY	{}
cmk37cpug00l3u23vesd2j6bj	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	7/19 - 2/19	5/19	FRACTION_SUBTRACTION	EASY	{}
cmk37cpug00l4u23v4ph8gw2w	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	1 7/8 - 3/8	1 1/4	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpug00l6u23v2r1gfnx1	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	1 9/14 - 5/14	1 2/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpug00l9u23vzigfoopx	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	3 3/5 - 1/5	3 2/5	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpug00lau23vcpsixfh6	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	5 4/8 - 3/8	5 1/8	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpug00lbu23v7eakd3ao	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	2 7/10 - 4/10	2 3/10	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpug00lcu23vxnxir6nb	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	4 5/12 - 2 7/12	1 5/6	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpug00ldu23v7tf2bfaw	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	3 1/6 - 5/6	2 1/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpuh00lgu23vjhs2ufhl	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	3 3/11 - 1 8/11	1 6/11	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpuh00lhu23va91z0235	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	5 2/13 - 3 9/13	1 6/13	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpuh00liu23v202sbg8c	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	2 1/4 - 3/4	1 1/2	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpuh00lju23vchdevm6p	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	7/9 - 5/9	2/9	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpuh00lku23v4pgo4u5a	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	11/15 - 7/15	4/15	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuh00llu23v38jhyaba	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	8/13 - 3/13	5/13	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuh00lmu23vvxyfk3tz	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	10/17 - 4/17	6/17	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00lou23vnsrjendr	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	8/10 - 3/10	1/2	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00lpu23vylmqb9l7	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	9/13 - 4/13	5/13	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00lqu23vwnkcj0g9	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	11/16 - 5/16	3/8	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00lru23vzepm979b	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	7/12 - 2/12	5/12	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00lsu23vh3ry2w9u	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	10/18 - 4/18	1/3	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00ltu23vgfucqxn7	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	13/15 - 8/15	1/3	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00luu23vlft1ieai	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	12/19 - 5/19	7/19	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00lvu23vsv4oznak	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	14/20 - 6/20	2/5	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00lwu23vcdromwsv	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	9/14 - 3/14	3/7	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00mhu23vu6klkefs	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	2 7/18 - 1 10/18	5/6	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question}
cmk37cpuk00lzu23vi3u7eh4p	2026-01-06 23:10:06.044	2026-03-14 17:58:15.614	3 8/13 - 5/13	3 3/13	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpuk00lyu23va165q9ds	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	2 7/10 - 3/10	2 2/5	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpuk00m0u23vbcsxj40u	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	1 9/12 - 4/12	1 5/12	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpuk00m1u23vh5u83njd	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	4 6/11 - 2/11	4 4/11	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpuk00m2u23vqbg4vxn2	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	3 5/8 - 2 3/8	1 1/4	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpuk00m3u23vnw02m4a3	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	4 6/7 - 3/7	4 3/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpuk00m4u23vkc3znhpq	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	3 5/9 - 1/9	3 4/9	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpuk00m5u23vq1qutkg5	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	2 8/11 - 4/11	2 4/11	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpuk00m6u23vj3yt5nlm	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	5 7/14 - 3 9/14	1 11/14	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpuk00m7u23vjpho15l9	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	4 2/5 - 1 4/5	2 3/5	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpuk00m8u23vc2z7ro1d	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	3 1/6 - 2 5/6	1/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question,single-digit-denominators}
cmk37cpuk00m9u23vot5nm7fc	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	5 3/8 - 2 7/8	2 4/8 = 2 1/2	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpuk00mau23v1r4p86c3	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	2 4/15 - 1 11/15	5/15 = 1/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question}
cmk37cpuk00mbu23v3ur9pktr	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	6 1/10 - 4 7/10	1 2/5	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpuk00mcu23vxlhn41kr	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	4 2/9 - 2 8/9	1 3/9 = 1 1/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpuk00mdu23vpa3spvoe	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	5/11 - 2/11	3/11	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00meu23vlz0v0tsk	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	13/17 - 6/17	7/17	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00mfu23vq4ujqe85	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	8/16 - 3/16	5/16	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00mgu23v879t0d7q	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	15/22 - 8/22	7/22	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00miu23v9jpd8ifo	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	6/11 - 2/11	4/11	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00mju23vrkrowac5	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	10/15 - 4/15	2/5	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00mku23v8wepugws	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	8/13 - 3/13	5/13	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00mlu23vrl9ttbz3	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	11/18 - 6/18	5/18	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00mmu23vn5bd2ibf	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	9/17 - 4/17	5/17	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00mnu23v59wpps3u	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	12/16 - 5/16	7/16	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00mou23v2l2akkhs	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	7/20 - 2/20	1/4	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00mpu23vlbuq7gmu	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	13/19 - 7/19	6/19	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00mqu23vv1t45z3j	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	10/14 - 3/14	1/2	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00mru23v2faenn3s	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	8/21 - 2/21	2/7	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00msu23vpmvunv44	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	1 8/12 - 3/12	1 5/12	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpun00mtu23v0rmtpc7b	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	2 7/14 - 5/14	2 1/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpun00muu23v5zhlf04d	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	1 9/15 - 4/15	1 5/15 = 1 1/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpun00mwu23vv5p0yodu	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	2 5/11 - 1 6/11	10/11	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question}
cmk37cpun00mxu23vokwoqoav	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	2 4/8 - 1/8	2 3/8	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpun00myu23vzwvoaqor	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	4 7/12 - 2/12	4 5/12	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpun00mzu23vepgcjiaf	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	3 5/10 - 2/10	3 3/10	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpun00n0u23v6b19zv5n	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	5 8/14 - 3 5/14	2 3/14	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpun00n1u23v1k2xbvkd	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	2 3/7 - 1 5/7	5/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question,single-digit-denominators}
cmk37cpun00n2u23vm591k1sb	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	4 1/9 - 3 4/9	2/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question,single-digit-denominators}
cmk37cpun00n3u23vea83qlf3	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	3 2/11 - 1 7/11	1 6/11	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpun00n4u23vokmgy7ka	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	2 3/13 - 1 8/13	8/13	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question}
cmk37cpun00n5u23vnepke3qp	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	5 4/15 - 2 9/15	2 10/15 = 2 2/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpun00n6u23v7k3mxnpe	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	3 5/16 - 1 11/16	1 10/16 = 1 5/8	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpun00n7u23v8sa95gnt	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	4/9 - 2/9	2/9	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpun00n8u23veozcuoym	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	7/10 - 3/10	4/10 = 2/5	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00n9u23vo4m67w4k	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	6/11 - 4/11	2/11	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00nau23vtdcxjo3q	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	9/16 - 5/16	4/16 = 1/4	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00nbu23v6kwb0std	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	8/13 - 2/13	6/13	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuq00ncu23vr2zw3j6o	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	7/9 - 2/9	5/9	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpuq00ndu23vwa52hw6n	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	11/12 - 5/12	1/2	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuq00neu23vsd2tix66	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	9/14 - 3/14	3/7	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuq00nfu23vjign6664	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	13/16 - 7/16	3/8	FRACTION_SUBTRACTION	EASY	{}
cmk37cpur00ngu23vh33is72i	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	8/11 - 3/11	5/11	FRACTION_SUBTRACTION	EASY	{}
cmk37cpur00nhu23vlxfy9o11	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	15/18 - 8/18	7/18	FRACTION_SUBTRACTION	EASY	{}
cmk37cpur00niu23v9cf3zzuj	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	10/13 - 4/13	6/13	FRACTION_SUBTRACTION	EASY	{}
cmk37cpur00nju23vsq7cksfp	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	14/17 - 6/17	8/17	FRACTION_SUBTRACTION	EASY	{}
cmk37cpur00nku23vvqxe6alu	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	9/20 - 4/20	1/4	FRACTION_SUBTRACTION	EASY	{}
cmk37cpur00nlu23vbbj6e24d	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	11/15 - 4/15	7/15	FRACTION_SUBTRACTION	EASY	{}
cmk37cpur00nmu23vmxs3tqxw	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	2 6/10 - 3/10	2 3/10	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpur00nnu23vau0fk2yr	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	3 8/13 - 4/13	3 4/13	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpur00nou23va6tmfpsd	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	1 7/12 - 2/12	1 5/12	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpur00npu23vfq97o8wn	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	4 9/16 - 5/16	4 4/16 = 4 1/4	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpur00nqu23vg1qpd439	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	2 5/8 - 1 2/8	1 3/8	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpur00nru23vkodjqplb	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	3 2/9 - 1/9	3 1/9	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpur00nsu23v00iudqjl	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	4 5/11 - 2/11	4 3/11	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37a6zy01zvu2l72mxy52wh	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/5 + 1 1/6	3 11/30	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zwu2l7tl1vp3rk	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/4 + 1 2/7	2 15/28	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zxu2l7civviuwm	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 2/5 + 1 1/3	3 11/15	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zyu2l743zdevg6	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/6 + 1 1/7	2 13/42	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zzu2l7jv1838gk	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/3 + 1 2/7	3 13/21	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0200u2l7wx68bga0	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 3/4 + 1 1/5	2 19/20	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0201u2l7i8tb725a	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/6 + 1 2/5	3 17/30	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0202u2l78chv0rod	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/7 + 1 1/4	2 15/28	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0203u2l74mtckib4	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/5 + 1 1/8	3 13/40	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zlu2l7ya1vpoa5	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 2/8 + 1 1/2	3 3/4	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zmu2l7ppnm7dsl	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/6 + 1 5/12	2 7/12	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01znu2l72fd8i7wa	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/5 + 1 4/10	3 3/5	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01zou2l7808mmefw	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/4 + 1 1/2	3	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zpu2l7cd9b3hjp	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/3 + 1 2/6	3 2/3	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zqu2l793so44dj	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 3/8 + 1 1/4	2 5/8	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zru2l7alofwj5i	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/9 + 1 1/3	3 4/9	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zsu2l7b166l5xd	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/3 + 1 1/4	2 7/12	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01ztu2l7k9g5fd3v	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/4 + 1 2/5	3 13/20	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zuu2l7wrvoo8uw	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/3 + 1 1/5	2 13/15	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01y4u2l756ugxs5a	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/2 + 1 1/4	2 3/4	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01y5u2l74w3d4bku	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/3 + 1 1/6	3 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01y8u2l78zv6ailw	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/5 + 1 1/10	2 3/10	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01yau2l7yjazztti	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/6 + 1 1/12	2 1/4	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37cpur00nuu23vvtn5iyog	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	5 6/13 - 2 4/13	3 2/13	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpur00nvu23vnnjhmy7q	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	3 2/7 - 1 5/7	1 4/7	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpur00nwu23vg7h36yk0	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	4 3/10 - 2 7/10	1 6/10 = 1 3/5	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpur00nxu23v8ab1fg8s	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	2 4/15 - 1 9/15	10/15 = 2/3	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question}
cmk37cpur00nyu23vyq5001mg	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	5 1/8 - 3 5/8	1 4/8 = 1 1/2	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpur00nzu23v44m0ow5u	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	3 3/11 - 1 8/11	1 6/11	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpur00o0u23vc7rljh45	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	4 2/9 - 2 7/9	1 4/9	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpur00o1u23vt387kghg	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	5/7 - 2/7	3/7	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpur00o2u23vdtto9hbp	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	9/11 - 4/11	5/11	FRACTION_SUBTRACTION	EASY	{}
cmk37cpur00o3u23vfx79w8ox	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	8/15 - 3/15	5/15 = 1/3	FRACTION_SUBTRACTION	EASY	{}
cmk37cpur00o4u23v9ogruwjl	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	12/17 - 5/17	7/17	FRACTION_SUBTRACTION	EASY	{}
cmk37cpur00o5u23vx2txtfzp	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	10/19 - 3/19	7/19	FRACTION_SUBTRACTION	EASY	{}
cmk37a6zy01ydu2l71zrx0eqj	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/5 + 1 1/15	3 4/15	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01ygu2l7vhylcq0o	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/4 + 1 1/8	2 5/8	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01yju2l7tmuxrjyw	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/8 + 1 1/4	3 3/8	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01ymu2l7ia46k7to	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/10 + 1 2/5	2 3/5	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01you2l7263te51i	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/2 + 1 3/8	2 7/8	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01yru2l71zskelsq	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/6 + 1 1/2	3 2/3	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01yuu2l77xsnwlwi	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/8 + 1 1/2	2 5/8	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01yxu2l7gvvafun9	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/12 + 1 1/3	3 5/12	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01yzu2l77xa8eun0	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/2 + 1 2/6	3 5/6	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01z2u2l7qvnmjsk3	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/8 + 1 3/4	2 7/8	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01z5u2l7chyxyk7h	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/10 + 1 1/5	3 3/10	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01z8u2l7czvi4jce	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/2 + 2 1/4	3 3/4	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01zau2l7flkbi1rv	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/5 + 1 3/10	2 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01zdu2l70cte7alo	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 3/10 + 1 1/5	3 1/2	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy01zfu2l7ubgoi3yr	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/8 + 1 1/2	3 5/8	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy01ziu2l7miz6rbkg	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 3/6 + 1 1/3	2 5/6	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0204u2l7emjbg5im	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/3 + 1 3/8	2 17/24	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0206u2l7t6zm6i1j	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/4 + 1 1/9	2 13/36	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0208u2l7ceyd2n0k	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/5 + 1 1/7	2 19/35	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020bu2l7ihi3jnu0	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 3/4 + 1 1/3	4 1/12	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020du2l7xfi37v9w	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 2/3 + 1 1/4	3 11/12	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020fu2l77wq79rwz	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/4 + 1 1/6	3 5/12	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020iu2l7qzvqvkg8	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/3 + 1 1/10	2 13/30	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy020ku2l78us0niee	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/7 + 1 1/6	2 13/42	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020nu2l7z5m1deo4	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/6 + 1 1/4	3 5/12	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020pu2l7bcvhpxe8	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 1/5 + 1 3/8	3 23/40	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020su2l75pgq9jre	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/9 + 1 1/4	2 13/36	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020uu2l75mb9gsxv	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/10 + 1 1/3	2 13/30	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy020wu2l7nky4r0va	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/5 + 1 1/6	2 17/30	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy020zu2l7jka96rff	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 3/8 + 1 1/5	3 23/40	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0212u2l7sgnquejw	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/5 + 1 2/9	2 19/45	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0214u2l7b18157ww	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 2/4 + 1 1/3	2 5/6	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0216u2l7ld98pwjz	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	1 1/7 + 1 2/9	2 23/63	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a6zy0219u2l72h5hhbpv	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 3/10 + 1 1/7	3 31/70	FRACTION_ADDITION	HARD	{mixed-numbers,unlike-denominators}
cmk37a6zy021bu2l7ni26m0u6	2026-01-06 23:08:08.302	2026-01-06 23:08:08.302	2 2/7 + 1 1/3	3 13/21	FRACTION_ADDITION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37cpt6007iu23vww4zamxg	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	1/8 + 3/8	1/2	FRACTION_ADDITION	EASY	{single-digit-denominators}
cmk37cpt60081u23vu4dixecb	2026-01-06 23:10:05.995	2026-01-06 23:10:05.995	4 2/6 + 3/6	4 5/6	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question,single-digit-denominators}
cmk37cpta008zu23v4plg0j4i	2026-01-06 23:10:05.998	2026-01-06 23:10:05.998	4 6/16 + 2 11/16	7 1/16	FRACTION_ADDITION	MEDIUM	{mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpu800j1u23vuk2sw2fh	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	6/8 - 4/8	1/4	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cptd009yu23v81a0z0dt	2026-01-06 23:10:06.001	2026-01-06 23:10:06.001	5/6 + 4/6	1 1/2	FRACTION_ADDITION	EASY	{mixed-numbers-in-answer,results-in-mixed-number,single-digit-denominators}
cmk37cpti00auu23v71rl6wfs	2026-01-06 23:10:06.007	2026-01-06 23:10:06.007	1/3 + 1/2	5/6	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37cptm00bpu23vt3jrdnlg	2026-01-06 23:10:06.01	2026-01-06 23:10:06.01	3/4 + 1/3	1 1/12	FRACTION_ADDITION	MEDIUM	{mixed-numbers-in-answer,results-in-mixed-number,single-digit-denominators,unlike-denominators}
cmk37cptq00cku23vjx6rb1ex	2026-01-06 23:10:06.014	2026-01-06 23:10:06.014	1/2 + 1/5	7/10	FRACTION_ADDITION	MEDIUM	{single-digit-denominators,unlike-denominators}
cmk37a705021eu2l73lqp1frv	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 1/2 - 1 1/4	1 1/4	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021gu2l7wrv5p5uz	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 1/4 - 1 1/8	1 1/8	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021ju2l79u0452vd	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/2 - 2 1/4	1 1/4	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021lu2l7c5skf7ms	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 3/4 - 1 1/8	2 5/8	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021ou2l7x7o6945f	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 1/3 - 1 1/9	1 2/9	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021ru2l7m02412i3	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/2 - 2 1/8	1 3/8	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021tu2l7p5nz3tv3	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 5/6 - 1 1/12	2 3/4	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705021vu2l7dz3inq0k	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/3 - 2 1/9	1 5/9	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705021yu2l7wsbqj07n	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 1/2 - 1 1/10	1 2/5	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7050221u2l7ax0ns9u3	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/2 - 1 1/4	2 1/4	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7050224u2l7maddb74p	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 5/6 - 1 1/12	1 3/4	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7050227u2l7vye7ag9d	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/5 - 1 1/15	2 1/3	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022au2l7uwddsggc	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 3/5 - 1 3/10	1 3/10	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022cu2l7kfq3yc82	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 2/3 - 1 1/9	1 5/9	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705022fu2l7vkfu8xzb	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 5/6 - 2 1/12	1 3/4	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022iu2l7rzdndo8w	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 3/4 - 1 3/8	1 3/8	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705022lu2l7qcxdkgmy	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/2 - 2 1/10	1 2/5	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a705022ou2l70fmfq2rg	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 1/3 - 1 1/6	1 1/6	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705022su2l7k6ntmc0a	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 5/6 - 1 1/3	1 1/2	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705022vu2l7vbwo2a9z	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/4 - 1 1/8	2 1/8	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a705022yu2l74gkgn6j8	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 2/3 - 1 1/15	1 3/5	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7050231u2l78q6xp68u	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 4/5 - 1 1/10	2 7/10	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7050234u2l7v0zaxcom	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 5/8 - 1 1/8	1 1/2	FRACTION_SUBTRACTION	MEDIUM	{mixed-numbers,single-digit-denominators}
cmk37a7050237u2l7dtjk01r7	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 3/4 - 2 1/8	1 5/8	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023au2l7yeoh9m28	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 2/3 - 1 2/9	1 4/9	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023du2l7j8gf0c7h	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/4 - 2 1/12	1 1/6	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706023hu2l7s74yhf7q	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/2 - 2 1/4	1 1/4	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023iu2l7dvmb4t7v	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 2/3 - 1 2/6	1 1/3	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023ku2l7eh1xjl4m	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	2 3/4 - 1 2/8	1 1/2	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023nu2l759dy92vj	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 3/4 - 1 2/5	2 7/20	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023pu2l7q3mo481n	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 2/3 - 1 3/8	3 7/24	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023ru2l7o5x2i2yc	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 1/3 - 1 2/5	2 14/15	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023uu2l7s751kckp	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 3/4 - 2 2/9	2 19/36	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023wu2l7rudz1kmf	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 1/3 - 2 3/7	2 16/21	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706023yu2l7o7f192qu	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/4 - 2 1/5	1 1/20	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060241u2l7hp2pgxt1	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 3/5 - 1 2/9	2 17/45	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060243u2l75mzd2cx4	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 3/7 - 1 2/5	3 31/35	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060246u2l71upme2u9	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 1/5 - 2 2/7	2 31/35	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060248u2l70jkcvtg0	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 2/7 - 2 3/8	1 37/56	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024bu2l7be6dp0gy	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 3/4 - 1 4/7	3 5/28	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024du2l7210cbbpf	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 5/8 - 1 2/3	1 23/24	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024gu2l7rt6ec8r8	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/7 - 2 1/4	1 1/28	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024iu2l7zt2v4uf8	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 1/3 - 2 2/5	2 14/15	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024lu2l7koa776cj	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 3/5 - 1 4/8	4 1/10	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024nu2l7ch8sgu23	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 5/7 - 1 1/3	3 8/21	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024qu2l7b0534s0c	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 1/5 - 2 1/7	2 2/35	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024su2l7k87j1b26	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 2/5 - 2 1/8	1 11/40	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024vu2l7ae1lvryr	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 5/9 - 1 1/6	2 7/18	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706024xu2l7ekoivtmm	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 3/8 - 1 1/5	4 7/40	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060250u2l7vqxxo5ri	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 5/8 - 2 1/3	3 7/24	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060252u2l7stwbxugb	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 1/3 - 2 3/8	1 23/24	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060255u2l7695f5b5u	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 5/6 - 1 4/9	3 7/18	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060257u2l71ywp981i	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 4/9 - 1 1/3	2 1/9	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a7060258u2l7s1pl1u3v	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 2/5 - 2 3/10	2 1/10	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706025cu2l71cpu0wre	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 2/6 - 2 1/5	3 1/30	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025fu2l79w9dl9jc	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 4/10 - 1 3/7	3 41/70	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706025hu2l7f9zecf6h	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 2/7 - 1 2/9	3 4/63	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025ku2l7axw8jq7y	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 4/9 - 2 2/7	2 10/63	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025mu2l70t1di0go	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 1/5 - 2 3/9	13/15	FRACTION_SUBTRACTION	HARD	{mixed-numbers,single-digit-denominators,unlike-denominators}
cmk37a706025pu2l7pjv3e1fz	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	3 4/7 - 1 3/10	2 19/70	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706025su2l7c7cryys0	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 5/11 - 2 2/7	2 13/77	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706025vu2l7f80t38ts	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	6 2/13 - 2 5/15	3 41/195	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706025zu2l72zatg5nw	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	6 1/11 - 2 3/12	3 29/132	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7060262u2l7ycow2m99	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 3/13 - 1 4/15	3 97/195	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7060266u2l7yy0pdmlt	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 7/13 - 1 5/9	4 8/117	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a7060269u2l7vr170774	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	7 5/9 - 3 2/13	4 47/117	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026cu2l7g0k5wu0c	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 2/15 - 1 4/11	2 82/165	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026gu2l77ia8bbfv	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 7/10 - 1 3/11	3 47/110	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026ku2l7mg30e1mc	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	4 4/13 - 1 1/10	3 27/130	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026nu2l72ol1sp7h	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	6 1/10 - 2 4/15	3 19/30	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026qu2l7ewj66gfr	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	5 4/11 - 1 5/13	3 97/143	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37a706026tu2l7p6zexu1q	2026-01-06 23:08:08.309	2026-01-06 23:08:08.309	7 1/13 - 2 3/11	4 86/143	FRACTION_SUBTRACTION	HARD	{mixed-numbers,unlike-denominators}
cmk37cpu800icu23vbvntqw77	2026-01-06 23:10:06.032	2026-01-06 23:10:06.032	5/8 - 2/8	3/8	FRACTION_SUBTRACTION	EASY	{single-digit-denominators}
cmk37cpub00jzu23vbdco3iy9	2026-01-06 23:10:06.035	2026-01-06 23:10:06.035	3 6/10 - 2 9/10	7/10	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-question}
cmk37cpug00kyu23v884lfjp1	2026-01-06 23:10:06.041	2026-01-06 23:10:06.041	11/16 - 5/16	6/16 = 3/8	FRACTION_SUBTRACTION	EASY	{}
cmk37cpuk00lxu23vyqzrmcgj	2026-01-06 23:10:06.044	2026-01-06 23:10:06.044	16/21 - 7/21	9/21 = 3/7	FRACTION_SUBTRACTION	EASY	{}
cmk37cpun00mvu23vgm3bxxqh	2026-01-06 23:10:06.048	2026-01-06 23:10:06.048	3 6/17 - 2/17	3 4/17	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37cpur00ntu23vxgbsafps	2026-01-06 23:10:06.051	2026-01-06 23:10:06.051	2 7/15 - 4/15	2 3/15 = 2 1/5	FRACTION_SUBTRACTION	MEDIUM	{may-require-borrowing,mixed-numbers,mixed-numbers-in-answer,mixed-numbers-in-question}
cmk37a6u90000u2l7jcqxanic	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Find the complementary angle of 25°.	65°	ANGLES	EASY	{complementary,basic}
cmk37a6u90011u2l7x59hhnn8	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Angles around a point are 75°, 105°, 90°, and x°. Find x.	90°	ANGLES	EASY	{around-point,basic}
cmk37a6u9001zu2l7hu95zn6e	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, the two equal angles are each 45°. Find the third angle.	90°	ANGLES	EASY	{triangle,angle-sum,isosceles}
cmk37a6u9002wu2l7o49z218q	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal forming angle a = 80°. Find the corresponding angle.	80°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6u9003pu2l74xd9o9ys	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one co-interior angle is 60°, find the other co-interior angle.	120°	ANGLES	MEDIUM	{parallel-lines,co-interior}
cmk37a6ua004lu2l7pta4dujz	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In a trapezium, three angles are 65°, 115°, and 115°. Find the fourth angle.	65°	ANGLES	MEDIUM	{trapezium,angle-sum}
cmk37a6ua005gu2l7w2850gya	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	In an isosceles triangle, each equal angle is (2x + 10)° and the third angle is 80°. Find x.	25	ANGLES	HARD	{triangle,algebra,isosceles}
cmk37a6ua0069u2l7rt9ndyu4	2026-01-06 23:08:08.097	2026-01-06 23:08:08.097	Two parallel lines are cut by a transversal. If one corresponding angle is 155°, find the other corresponding angle.	155°	ANGLES	MEDIUM	{parallel-lines,corresponding}
cmk37a6vc0075u2l7k73mivke	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a square with side length 12m.	48 m	AREA	EASY	{square,perimeter}
cmk37a6vd0085u2l7nri4158a	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a square with side length 15m.	225 m²	AREA	EASY	{square,basic}
cmk37a6vd0086u2l7rssiwft3	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the perimeter of a rectangle with length 11m and width 9m.	40 m	AREA	EASY	{rectangle,perimeter}
cmk37a6vd0095u2l7dzdsmg06	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A rectangle has length 21cm and width 6cm. Find its area.	126 cm²	AREA	EASY	{rectangle,centimeters}
cmk37a6vd00a5u2l7jflgaojt	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the circumference of a circle with radius 11m. Use π = 3.14.	69.08 m	AREA	MEDIUM	{circle,circumference,pi-given}
cmk37a6vd00b2u2l7t8yddnvq	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a composite shape: a rectangle (11cm × 6cm) joined to a rectangle (5cm × 4cm).	86 cm²	AREA	MEDIUM	{composite,rectangles,centimeters}
cmk37a6ve00bzu2l7xiwfs4f0	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A square has area 144m². Find the length of its sides.	12 m	AREA	HARD	{reverse-problem,square}
cmk37a6ve00cxu2l7iywsgged	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	Find the area of a triangle with base 52m and height 23m.	598 m²	AREA	MEDIUM	{triangle,basic}
cmk37a6ve00duu2l7mck2iwtj	2026-01-06 23:08:08.136	2026-01-06 23:08:08.136	A football field is 105m long and 68m wide. Find its area.	7140 m²	AREA	HARD	{word-problem,rectangle,large-numbers}
cmk37a6vy00euu2l7xxgrbn9z	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point H is at (5, 6). What is 2y?	12	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00fvu2l7iohdjgk6	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Plot (3, 10). What is 2x?	6	COORDINATES_PLOTTING	EASY	{quadrant-1,arithmetic}
cmk37a6vy00gwu2l763c3f1vu	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point is at (-5, -8). What quadrant is it in?	Quadrant 3	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,quadrants}
cmk37a6vy00hwu2l7s5h6cia2	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	What are the coordinates at x = -7 and y = 9?	(-7, 9)	COORDINATES_PLOTTING	MEDIUM	{quadrant-2,negative-integers,basic}
cmk37a6vz00ixu2l7iipof6uz	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	Point Z is at (-10, -9). What is x + y?	-19	COORDINATES_PLOTTING	MEDIUM	{quadrant-3,arithmetic}
cmk37a6vz00jyu2l71ivrz95o	2026-01-06 23:08:08.157	2026-01-06 23:08:08.157	A point has x = -20 and y = 15. What is x - y?	-35	COORDINATES_PLOTTING	HARD	{large-numbers,arithmetic}
cmk37a6wi00kzu2l713aykaa2	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 2, 4, 6, 8	5	DATA_ANALYSIS	EASY	{median,basic,even-count}
cmk37a6wi00m7u2l7kkbs0duc	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 5, 15, 25, 35, 45	25	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wi00ndu2l7xjvno5da	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the median of: 12, 24, 36	24	DATA_ANALYSIS	EASY	{median,basic,odd-count}
cmk37a6wj00oeu2l7s8xivyi0	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the range of: 21, 30, 39, 48, 57, 66	45	DATA_ANALYSIS	MEDIUM	{range,six-values}
cmk37a6wj00pau2l73r7ysalr	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A group has 4 people with mean age 25. A 5th person joins with age 35. What is the new mean?	27	DATA_ANALYSIS	HARD	{mean,adding-value,context}
cmk37a6wj00q7u2l7vyt1eijo	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	A dataset has values 7, 10, 13, x, 19. If the median is 13, find a possible value for x.	13 or greater	DATA_ANALYSIS	MEDIUM	{median,missing-value}
cmk37a6wk00r6u2l7u3umi0yt	2026-01-06 23:08:08.178	2026-01-06 23:08:08.178	Find the mean of: 11, 24, 37, 50, 63, 76	43.5	DATA_ANALYSIS	MEDIUM	{mean,six-values,decimal}
cmk37a6wz00s7u2l7ewq5elon	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.25 + 0.5	1.75	DECIMALS_ADDITION	EASY	{mixed-decimal-places}
cmk37a6wz00tgu2l7dvurgyjj	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.75 - 0.25	0.5	DECIMALS_SUBTRACTION	EASY	{two-decimal-places}
cmk37a6x000uru2l71othbvv9	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	0.25 × 12	3	DECIMALS_MULTIPLICATION	MEDIUM	{decimal-times-whole}
cmk37a6x000xdu2l7rex4coih	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	1.2 - 0.4 × 2	0.4	DECIMALS_ADDITION	HARD	{mixed-operations,order-of-operations}
cmk37a6x100yju2l7vwush7i6	2026-01-06 23:08:08.195	2026-01-06 23:08:08.195	2.4 + 1.6 × 0.5 - 0.8 ÷ 2	2.8	DECIMALS_ADDITION	HARD	{mixed-operations,four-operations}
cmk37a6xd00zpu2l7pjzvihux	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3/7 ÷ 4/7	3/4	FRACTION_DIVISION	EASY	{proper-fractions,both-proper}
cmk37a6xe010vu2l7casruk85	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	24/35 ÷ 12/25	1 3/7	FRACTION_DIVISION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6xf0120u2l7s2v1w8z8	2026-01-06 23:08:08.209	2026-01-06 23:08:08.209	3 1/3 ÷ 2/3	5	FRACTION_DIVISION	HARD	{mixed-numbers,divide-by-fraction}
cmk37a6y10137u2l71w1273j8	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	1/6 × 1/2	1/12	FRACTION_MULTIPLICATION	EASY	{proper-fractions,no-simplification}
cmk37a6y1014cu2l7sbp8th4f	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	9/11 × 5/6	15/22	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2015hu2l751lwt6ka	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	27/64 × 32/81	1/6	FRACTION_MULTIPLICATION	MEDIUM	{proper-fractions,simplification-needed}
cmk37a6y2016ou2l7fbbndund	2026-01-06 23:08:08.233	2026-01-06 23:08:08.233	2 1/2 × 2/3	1 2/3	FRACTION_MULTIPLICATION	HARD	{mixed-numbers,one-mixed}
cmk37a6yb0180u2l77q35ol8q	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	2¹	2	INDEX_POWERS	EASY	{power-one,power-of-2}
cmk37a6yb019gu2l7wkt3tcjr	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√125	5√5	INDEX_SQUARE_ROOTS	EASY	{simplify-roots}
cmk37a6yb01aqu2l7m4b47d40	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	m⁷ ÷ m⁴	m³	INDEX_LAWS	MEDIUM	{division-law,variable}
cmk37a6yc01byu2l7910n03cs	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	√9 × √16	12	INDEX_SQUARE_ROOTS	MEDIUM	{multiply-roots}
cmk37a6yc01dau2l7r3zrk5ix	2026-01-06 23:08:08.242	2026-01-06 23:08:08.242	64^(1/3)	4	INDEX_POWERS	HARD	{fractional-exponent,cube-root}
cmk37a6yo01egu2l7b1kyy4v2	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(-5) + 9	4	INTEGERS_ADDITION	EASY	{negative-plus-positive}
cmk37a6yo01fsu2l70plpku6q	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	4 - (-3)	7	INTEGERS_SUBTRACTION	EASY	{subtracting-negative}
cmk37a6yp01h3u2l70m78om0l	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	9 × (-2)	-18	INTEGERS_MULTIPLICATION	MEDIUM	{positive-times-negative}
cmk37a6yp01ieu2l7uj5659ri	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	30 ÷ (-5)	-6	INTEGERS_DIVISION	MEDIUM	{positive-div-negative}
cmk37a6yp01jpu2l7zzrn7aty	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	(5 + 3) × 2	16	INTEGERS_ADDITION	HARD	{mixed-operations,brackets}
cmk37a6yq01kvu2l7jfcti9p8	2026-01-06 23:08:08.256	2026-01-06 23:08:08.256	4 × (2 - 7)	-20	INTEGERS_ADDITION	HARD	{mixed-operations,brackets,result-negative}
cmk37a6z201m2u2l7noll1sll	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x + 2 = 11	x = 9	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,addition}
cmk37a6z201nbu2l74wxmm2ti	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	x/3 = 8	x = 24	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	EASY	{one-step,division}
cmk37a6z301olu2l7l06nk8cq	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	3x + 5 = 26	x = 7	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	MEDIUM	{two-step,addition}
cmk37a6z301qzu2l7tqsicc3u	2026-01-06 23:08:08.27	2026-01-06 23:08:08.27	5(2x + 2) = 50	x = 4	ALGEBRA_LINEAR_EQUATIONS_SIMPLE	HARD	{with-brackets,distributive-law,coefficient-in-brackets}
cmk37a6zm01s1u2l7hwjg2y4p	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 3x + 2, what is y when x = 3?	11	LINEAR_GRAPHING	EASY	{substitution,evaluation}
cmk37a6zn01t4u2l7thgbseg9	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	If y = 9x, what is y when x = 2?	18	LINEAR_GRAPHING	EASY	{substitution,through-origin}
cmk37a6zn01u6u2l7we8hepkp	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient 3 and y-intercept 0.	y = 3x	LINEAR_GRAPHING	MEDIUM	{write-equation,through-origin}
cmk37a6zn01v5u2l7bjrmm7j7	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Find the gradient of the line through (0, 4) and (3, 13).	3	LINEAR_GRAPHING	MEDIUM	{gradient-two-points}
cmk37a6zo01w4u2l7tnqeif1q	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	What is the gradient of a line parallel to y = -3x + 7?	-3	LINEAR_GRAPHING	HARD	{parallel-lines,negative-slope}
cmk37a6zo01x1u2l793bx2lbj	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	A battery has 100% charge and drains at 10% per hour. Write an equation for charge C after t hours.	C = 100 - 10t	LINEAR_GRAPHING	HARD	{real-world,decreasing,percentage}
cmk37a6zo01y1u2l74wrlp36j	2026-01-06 23:08:08.29	2026-01-06 23:08:08.29	Write the equation of a line with gradient -12 and y-intercept 24.	y = -12x + 24	LINEAR_GRAPHING	MEDIUM	{write-equation,gradient-intercept,negative-slope}
cmk37a70p026uu2l7hwa0s7pk	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 1/2 to a percentage	50%	PERCENTAGE_CONVERSION	EASY	{fraction-to-percentage,common-fractions}
cmk37a70p0291u2l7ozu7f0bz	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 20% to a decimal	0.2	PERCENTAGE_CONVERSION	EASY	{percentage-to-decimal}
cmk37a70q02a4u2l7ypdr2wa7	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Convert 95% to a fraction in simplest form	19/20	PERCENTAGE_CONVERSION	MEDIUM	{percentage-to-fraction,twentieths}
cmk37a70q02b5u2l7obmtj0e4	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 25% of 80	20	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity,quarters}
cmk37a70q02ccu2l736zvg7nj	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	Find 45% of 100	45	PERCENTAGE_OF_QUANTITY	MEDIUM	{percentage-of-quantity}
cmk37a70r02dju2l7vqz1wv6p	2026-01-06 23:08:08.329	2026-01-06 23:08:08.329	A book costs $40. It is on sale for 20% off. What is the sale price?	$32	PERCENTAGE_OF_QUANTITY	HARD	{word-problem,discount}
cmk37a71502egu2l7o2sz0gsq	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a 1, 2, or 3 on a standard die?	1/2	PROBABILITY	EASY	{dice,or,fraction}
cmk37a71502ehu2l7ccpm3q95	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 4 red balls, 3 blue balls, and 3 green balls. What is the probability of picking a red ball?	2/5	PROBABILITY	EASY	{balls,basic,fraction}
cmk37a71502fcu2l73wutpwhv	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of picking a vowel from the letters A, B, C, D, E?	2/5	PROBABILITY	EASY	{letters,vowel,fraction}
cmk37a71502g7u2l7gj1xev46	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	What is the probability of rolling a number less than 1 on a standard die?	0	PROBABILITY	EASY	{dice,impossible}
cmk37a71602h2u2l7xy9m8m6e	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 8 red balls and 2 blue balls. What is the probability of picking a blue ball? Express as a percentage.	20%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71602hxu2l7b7skmba1	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	You flip a coin three times. What is the probability of getting tails all three times?	1/8	PROBABILITY	MEDIUM	{coin,three-events,independent}
cmk37a71602iru2l7gs6f5dch	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 6 red balls and 4 blue balls. You pick one ball, do not replace it, then pick another. What is the probability both are red?	1/3	PROBABILITY	HARD	{balls,without-replacement,dependent}
cmk37a71602jku2l7j1yndjgc	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 8 red balls and 4 blue balls. You pick one ball, do not replace it, then pick another. What is the probability the first is blue and the second is red?	8/33	PROBABILITY	HARD	{balls,without-replacement,dependent}
cmk37a71602kdu2l7h6vjmajy	2026-01-06 23:08:08.345	2026-01-06 23:08:08.345	A bag contains 3 red balls and 17 blue balls. What is the probability of picking a red ball? Express as a percentage.	15%	PROBABILITY	MEDIUM	{balls,percentage}
cmk37a71j02liu2l7y98546wa	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 16:4.	4:1	RATIO_RATES	EASY	{simplify-ratio,basic}
cmk37a71k02mpu2l7d0a3m5bt	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Simplify the ratio 36:9.	4:1	RATIO_RATES	EASY	{simplify-ratio}
cmk37a71k02nxu2l7zy2ucv29	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	If 5 apples cost $10, what is the cost per apple?	$2	RATIO_RATES	MEDIUM	{rate,unit-price}
cmk37a71k02p2u2l7ob43sdhh	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 91 in the ratio 6:7.	42 and 49	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71k02q2u2l7gdd9dvji	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Which is the better buy: 3 pens for $9 or 7 pens for $20?	3 pens for $9	RATIO_RATES	HARD	{best-buy,unit-price}
cmk37a71l02qzu2l7ttie3u4o	2026-01-06 23:08:08.359	2026-01-06 23:08:08.359	Divide 12 in the ratio 1:3.	3 and 9	RATIO_RATES	MEDIUM	{divide-quantity}
cmk37a71x02s4u2l7jy538fz8	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = 5, find x - 3	2	ALGEBRA_SUBSTITUTION	EASY	{single-variable,subtraction}
cmk37a71x02tau2l7y7jlnq81	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If x = -5, find -3x + 2	17	ALGEBRA_SUBSTITUTION	MEDIUM	{single-variable,negative-value,negative-coefficient}
cmk37a71x02ueu2l7o1ja11dz	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	If a = 5 and b = 9, find 7a - 4b	-1	ALGEBRA_SUBSTITUTION	MEDIUM	{two-variables,subtraction}
cmk37a71y02viu2l7ig99xann	2026-01-06 23:08:08.373	2026-01-06 23:08:08.373	P = 2l + 2w. Find P when l = 10 and w = 6	32	ALGEBRA_SUBSTITUTION	HARD	{formula,perimeter}
cmk37cps30009u23v32sxcb2i	2026-01-06 23:10:05.955	2026-01-06 23:10:05.955	7d - 2d - 3d	2d	ALGEBRA_COLLECTING_TERMS	EASY	{}
cmk37cpsg002fu23vmqmfn1q5	2026-01-06 23:10:05.968	2026-01-06 23:10:05.968	6a² + 2a² + a²	9a²	ALGEBRA_COLLECTING_TERMS	HARD	{has-powers}
cmk37cpst004nu23vve26kwdq	2026-01-06 23:10:05.981	2026-01-06 23:10:05.981	4a × a	4a²	ALGEBRA_MULTIPLICATION	MEDIUM	{}
cmk37cpsx005tu23vqw9gzm36	2026-01-06 23:10:05.985	2026-01-06 23:10:05.985	(2m)³	8m³	ALGEBRA_MULTIPLICATION	HARD	{has-powers}
cmk37cptt00dju23v8e9xymi9	2026-01-06 23:10:06.017	2026-01-06 23:10:06.017	18/21	6/7	FRACTION_REDUCTION	EASY	{requires-reduction}
cmk37cptv00eou23vrbudcd8e	2026-01-06 23:10:06.019	2026-01-06 23:10:06.019	25/40	5/8	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
cmk37cpty00ftu23v5vp3hi9u	2026-01-06 23:10:06.022	2026-01-06 23:10:06.022	40/50	4/5	FRACTION_REDUCTION	HARD	{requires-reduction}
cmk37cpu300gyu23vuaxupzut	2026-01-06 23:10:06.028	2026-01-06 23:10:06.028	22/44	1/2	FRACTION_REDUCTION	MEDIUM	{requires-reduction}
\.


--
-- Data for Name: WorksheetProblem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."WorksheetProblem" (id, "worksheetId", "problemId", "position", "createdAt") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
489a9e97-deca-4d1f-a4dd-7e6f9b643d36	6b76da6e15285bda033b69f54de28f9dc3f775210d4d4189904cb9b86ef3e310	2026-01-07 09:58:37.856416+11	20251209103210_init	\N	\N	2026-01-07 09:58:37.849214+11	1
183e1d2e-3f6d-4c59-a089-e7c187dd7450	fdb1e5a44e27a6c22643a300fb71682d348cf55cf5fc7127e87c4fb06980fa05	2026-01-07 09:58:37.860528+11	20251210031940_schema_improvements	\N	\N	2026-01-07 09:58:37.856671+11	1
816473bd-6a6c-427b-89a8-2374eb936c4a	11e7ac02bcdd5608d7ab27b0b06924b0ee0af4eb7c7f6471e0ff9a055e0d5e0f	2026-01-07 09:58:37.861453+11	20251230032143_add_percentage_types	\N	\N	2026-01-07 09:58:37.860739+11	1
5e28eb27-6ddc-41e9-9c41-964d40f63d52	0c5fdcee79b515d8f4d7a480512322f5cad02d7e009fefa448ed2175f1d74c8d	2026-01-07 09:58:37.862565+11	20251230032915_add_integer_types	\N	\N	2026-01-07 09:58:37.861742+11	1
025cb5de-c8f1-48a6-a7f9-6475a5dec37b	9331631d12c9177ea29e542c1f513359031da5c345e8d5b2f84fc64b47cd0ee3	2026-01-07 09:58:37.863544+11	20251230033552_add_decimal_types	\N	\N	2026-01-07 09:58:37.862806+11	1
d2f61004-e1f9-4f94-aa47-538abe60e31f	a60d885f4ef6558deea8028a3df015accec6f8a72c6317d4a3b13df473070c01	2026-01-07 09:58:37.864607+11	20251230034530_add_index_notation_types	\N	\N	2026-01-07 09:58:37.86377+11	1
bb3ab8e8-e0cc-44b0-8caa-d2364b77c8e8	944b2ce3c51ff15a0fc72ba97ac80cd79f5cbe9a7271e1eb522249227b44032a	2026-01-07 09:58:37.865411+11	20251230085347_add_ratio_rates_type	\N	\N	2026-01-07 09:58:37.864843+11	1
462a0941-4fda-4ad5-9361-4c55a5b236de	2ff70b2463ac0c04005bcaf53504716e61cee094b444bdf6930c2072c11c2c92	2026-01-07 09:58:37.866119+11	20251230090222_add_area_type	\N	\N	2026-01-07 09:58:37.865599+11	1
1a6ddac0-b0e5-4f72-9b4c-2ad43bd470c6	d9ba5d313fd5c33d25f8b5605be1ded5a5be7a74dee856a61b599d19c711ab00	2026-01-07 09:58:37.866872+11	20251230091258_add_angles_type	\N	\N	2026-01-07 09:58:37.866293+11	1
fb35d2b6-8294-4999-99e7-142ca4ebffb7	2633cf97d4ed32f395ae710beb6a4fdaa00e2dab5126486e5139c57e852ec21b	2026-01-07 09:58:37.86768+11	20251230092155_add_probability_type	\N	\N	2026-01-07 09:58:37.867094+11	1
d769af7a-1cd7-4717-a132-a40f071fe770	3572981e7ba3c6ee37a783e77908980d221c8ce6c28f593cd1f27715f10ae14a	2026-01-07 09:58:37.868493+11	20251230093050_add_data_analysis_type	\N	\N	2026-01-07 09:58:37.867883+11	1
0299b1c3-4441-4f80-ac9e-27aa814fce90	d037af2c9d94ae06b6a41eccb83aef4308ef931fa087876ee6507e482543044c	2026-01-07 09:58:37.869702+11	20251231173305_remove_unused_metadata_columns	\N	\N	2026-01-07 09:58:37.868694+11	1
4241d55b-8a55-4eab-b468-837d443a2b80	40cbdde5bbf8874e262dfefc549290e0075fbf0b1133b7d78345b7db1c6426ed	2026-01-16 18:42:43.182361+11	20260116184217_remove_unused_problem_columns		\N	2026-01-16 18:42:43.182361+11	0
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 49Kt9WgGThzb4YGf6S85HJjzP0UGHg44lpevbbNG4tOKQBBZLlrbpXblKqaAAgK

